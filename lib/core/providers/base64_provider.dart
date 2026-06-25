import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'dart:convert';

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

      // Detect URL-safe variant
      final isUrlSafe = input.contains('-') || input.contains('_');

      List<int> bytes;
      if (isUrlSafe || state.variant == Base64Variant.urlSafe) {
        bytes = base64Url.decode(base64Url.normalize(input));
      } else {
        // Pad if needed
        while (input.length % 4 != 0) input += '=';
        bytes = base64.decode(input);
      }

      final result = utf8.decode(bytes, allowMalformed: true);

      // Check if it's an image data URL
      final isImage = result.startsWith('data:image/');
      final originalInput = state.input.replaceAll(RegExp(r'\s'), '');
      final dataUrl = isImage ? result : (originalInput.startsWith('data:image/') ? originalInput : null);

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
      final clean = input.replaceAll(RegExp(r'\s'), '');
      base64.decode(base64.normalize(clean));
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
    return 'Input: ${state.inputBytes} bytes  →  Output: ${state.outputBytes} ${state.mode == Base64Mode.encode ? 'chars' : 'bytes'}  (${ratio}%)';
  }

  bool get inputIsValidBase64 =>
      state.mode == Base64Mode.decode && state.input.isNotEmpty && isValidBase64(state.input);
}

final base64Provider = NotifierProvider<Base64Notifier, Base64State>(
  Base64Notifier.new,
);