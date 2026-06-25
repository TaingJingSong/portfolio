import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'dart:convert';
import 'dart:math';

enum Base64Mode { encode, decode }
enum Base64Variant { standard, urlSafe }

class Base64State {
  final String input;
  final String output;
  final Base64Mode mode;
  final Base64Variant variant;
  final bool wrapLines;
  final bool stripWhitespace;
  final bool autoProcess;
  final String? error;
  final int inputBytes;
  final int outputBytes;
  final bool isImageDataUrl;
  final String? imageDataUrl;

  const Base64State({
    this.input = '',
    this.output = '',
    this.mode = Base64Mode.encode,
    this.variant = Base64Variant.standard,
    this.wrapLines = false,
    this.stripWhitespace = true,
    this.autoProcess = true,
    this.error,
    this.inputBytes = 0,
    this.outputBytes = 0,
    this.isImageDataUrl = false,
    this.imageDataUrl,
  });

  Base64State copyWith({
    String? input,
    String? output,
    Base64Mode? mode,
    Base64Variant? variant,
    bool? wrapLines,
    bool? stripWhitespace,
    bool? autoProcess,
    String? error,
    bool clearError = false,
    int? inputBytes,
    int? outputBytes,
    bool? isImageDataUrl,
    String? imageDataUrl,
    bool clearImage = false,
  }) =>
      Base64State(
        input: input ?? this.input,
        output: output ?? this.output,
        mode: mode ?? this.mode,
        variant: variant ?? this.variant,
        wrapLines: wrapLines ?? this.wrapLines,
        stripWhitespace: stripWhitespace ?? this.stripWhitespace,
        autoProcess: autoProcess ?? this.autoProcess,
        error: clearError ? null : error ?? this.error,
        inputBytes: inputBytes ?? this.inputBytes,
        outputBytes: outputBytes ?? this.outputBytes,
        isImageDataUrl: isImageDataUrl ?? this.isImageDataUrl,
        imageDataUrl: clearImage ? null : imageDataUrl ?? this.imageDataUrl,
      );
}

class Base64Notifier extends Notifier<Base64State> {
  @override
  Base64State build() => const Base64State();

  void setInput(String value) {
    state = state.copyWith(
      input: value,
      inputBytes: utf8.encode(value).length,
    );
    if (state.autoProcess) _process();
  }

  void setMode(Base64Mode mode) {
    state = state.copyWith(mode: mode, input: '', output: '', clearError: true, inputBytes: 0, outputBytes: 0, clearImage: true);
  }

  void setVariant(Base64Variant variant) {
    state = state.copyWith(variant: variant);
    if (state.autoProcess && state.input.isNotEmpty) _process();
  }

  void toggleWrapLines() {
    state = state.copyWith(wrapLines: !state.wrapLines);
    if (state.autoProcess && state.input.isNotEmpty) _process();
  }

  void toggleStripWhitespace() {
    state = state.copyWith(stripWhitespace: !state.stripWhitespace);
    if (state.autoProcess && state.input.isNotEmpty) _process();
  }

  void toggleAutoProcess() {
    state = state.copyWith(autoProcess: !state.autoProcess);
  }

  void process() => _process();

  void _process() {
    if (state.input.isEmpty) {
      state = state.copyWith(output: '', clearError: true, outputBytes: 0, clearImage: true);
      return;
    }
    if (state.mode == Base64Mode.encode) {
      _encode();
    } else {
      _decode();
    }
  }

  void _encode() {
    try {
      final bytes = utf8.encode(state.input);
      String result;
      if (state.variant == Base64Variant.urlSafe) {
        result = base64Url.encode(bytes);
      } else {
        result = base64.encode(bytes);
      }
      if (state.wrapLines) {
        result = _wrapAt76(result);
      }
      state = state.copyWith(
        output: result,
        outputBytes: result.length,
        clearError: true,
        clearImage: true,
      );
    } catch (e) {
      state = state.copyWith(error: 'Encoding failed: $e', clearImage: true);
    }
  }

  void _decode() {
    try {
      var input = state.input;
      if (state.stripWhitespace) {
        input = input.replaceAll(RegExp(r'\s'), '');
      }

      // If input is a full Data URL (e.g. data:image/png;base64,iVBOR...), strip prefix
      final dataUrlRegex = RegExp(r'^data:[^;]+;base64,', caseSensitive: false);
      final hasDataUrlPrefix = dataUrlRegex.hasMatch(input);
      if (hasDataUrlPrefix) {
        input = input.replaceFirst(dataUrlRegex, '');
      }

      // Detect URL-safe variant
      final isUrlSafe = input.contains('-') || input.contains('_');

      List<int> bytes;
      if (isUrlSafe || state.variant == Base64Variant.urlSafe) {
        bytes = base64Url.decode(base64Url.normalize(input));
      } else {
        // Pad if needed
        var padded = input;
        while (padded.length % 4 != 0) {
          padded += '=';
        }
        bytes = base64.decode(padded);
      }

      // Check if the decoded payload is binary or text, and if it's an image
      final mimeType = _detectImageMimeType(bytes);
      final isImage = mimeType != null;
      
      String result;
      String? dataUrl;
      
      if (isImage) {
        result = '[Binary Image Data - $mimeType]';
        dataUrl = 'data:$mimeType;base64,${base64.encode(bytes)}';
      } else {
        result = utf8.decode(bytes, allowMalformed: true);
        // Fallback: check if the text itself contains a data URL (like SVG or inline images)
        if (result.startsWith('data:image/')) {
          dataUrl = result;
        }
      }

      state = state.copyWith(
        output: result,
        outputBytes: bytes.length,
        clearError: true,
        isImageDataUrl: dataUrl != null,
        imageDataUrl: dataUrl,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Invalid Base64 input. Make sure the input is properly encoded.',
        clearImage: true,
      );
    }
  }

  String? _detectImageMimeType(List<int> bytes) {
    if (bytes.length < 4) return null;
    
    // PNG: 89 50 4E 47
    if (bytes[0] == 137 && bytes[1] == 80 && bytes[2] == 78 && bytes[3] == 71) {
      return 'image/png';
    }
    
    // JPEG: FF D8 FF
    if (bytes[0] == 255 && bytes[1] == 216 && bytes[2] == 255) {
      return 'image/jpeg';
    }
    
    // GIF: GIF8 (47 49 46 38)
    if (bytes[0] == 71 && bytes[1] == 73 && bytes[2] == 70 && bytes[3] == 56) {
      return 'image/gif';
    }
    
    // WEBP: RIFF (52 49 46 46) ... WEBP (57 45 42 50)
    if (bytes[0] == 82 && bytes[1] == 73 && bytes[2] == 70 && bytes[3] == 70) {
      if (bytes.length >= 12 &&
          bytes[8] == 87 && bytes[9] == 69 && bytes[10] == 66 && bytes[11] == 80) {
        return 'image/webp';
      }
    }
    
    // SVG: Check if it looks like SVG (XML markup)
    try {
      final lead = utf8.decode(bytes.take(min(bytes.length, 100)).toList()).trim().toLowerCase();
      if (lead.startsWith('<svg') || lead.startsWith('?xml') && lead.contains('<svg')) {
        return 'image/svg+xml';
      }
    } catch (_) {}

    return null;
  }

  void swapInputOutput() {
    final newInput = state.output;
    final newMode = state.mode == Base64Mode.encode ? Base64Mode.decode : Base64Mode.encode;
    state = state.copyWith(
      input: newInput,
      output: '',
      mode: newMode,
      inputBytes: utf8.encode(newInput).length,
      clearError: true,
      clearImage: true,
    );
    _process();
  }

  void clear() => state = const Base64State();

  bool isValidBase64(String input) {
    try {
      var clean = input.replaceAll(RegExp(r'\s'), '');
      
      // Strip prefix if present
      final dataUrlRegex = RegExp(r'^data:[^;]+;base64,', caseSensitive: false);
      if (dataUrlRegex.hasMatch(clean)) {
        clean = clean.replaceFirst(dataUrlRegex, '');
      }

      if (clean.contains('-') || clean.contains('_')) {
        base64Url.decode(base64Url.normalize(clean));
      } else {
        base64.decode(base64.normalize(clean));
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  String _wrapAt76(String input) {
    final buffer = StringBuffer();
    for (var i = 0; i < input.length; i += 76) {
      buffer.writeln(input.substring(i, i + 76 > input.length ? input.length : i + 76));
    }
    return buffer.toString().trimRight();
  }

  String get stats {
    if (state.input.isEmpty) return '';
    final ratio = state.inputBytes > 0
        ? (state.outputBytes / state.inputBytes * 100).toStringAsFixed(1)
        : '0';
    return 'Input: ${state.inputBytes} bytes  →  Output: ${state.outputBytes} ${state.mode == Base64Mode.encode ? 'chars' : 'bytes'}  ($ratio%)';
  }

  bool get inputIsValidBase64 =>
      state.mode == Base64Mode.decode && state.input.isNotEmpty && isValidBase64(state.input);
}

final base64Provider = NotifierProvider<Base64Notifier, Base64State>(
  Base64Notifier.new,
);