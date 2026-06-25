import 'dart:convert';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class JsonFormatterState {
  final String input;
  final String output;
  final String? error;
  final bool minify;
  final bool autoFormat;
  final int indentSpaces;
  final bool sortKeys; // NEW: Alphabetical sorting

  const JsonFormatterState({
    this.input = '',
    this.output = '',
    this.error,
    this.minify = false,
    this.autoFormat = true,
    this.indentSpaces = 2,
    this.sortKeys = false,
  });

  JsonFormatterState copyWith({
    String? input,
    String? output,
    String? error,
    bool? minify,
    bool? autoFormat,
    int? indentSpaces,
    bool? sortKeys,
    bool clearError = false,
  }) {
    return JsonFormatterState(
      input: input ?? this.input,
      output: output ?? this.output,
      error: clearError ? null : error ?? this.error,
      minify: minify ?? this.minify,
      autoFormat: autoFormat ?? this.autoFormat,
      indentSpaces: indentSpaces ?? this.indentSpaces,
      sortKeys: sortKeys ?? this.sortKeys,
    );
  }

  String get outputStats {
    if (output.isEmpty) return '0 lines • 0 B';
    final lines = output.split('\n').length;
    final bytes = utf8.encode(output).length;
    final size = bytes < 1024 ? '$bytes B' : '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '$lines lines • $size';
  }
}

class JsonFormatterProvider extends Notifier<JsonFormatterState> {
  @override
  JsonFormatterState build() => const JsonFormatterState();

  void setInput(String value) {
    state = state.copyWith(input: value);
    if (state.autoFormat) format();
  }

  void toggleMinify() {
    state = state.copyWith(minify: !state.minify);
    if (state.input.isNotEmpty && state.error == null) format();
  }

  void toggleAutoFormat() {
    state = state.copyWith(autoFormat: !state.autoFormat);
    if (state.autoFormat && state.input.isNotEmpty) format();
  }

  void toggleSortKeys() {
    state = state.copyWith(sortKeys: !state.sortKeys);
    if (state.input.isNotEmpty && state.error == null) format();
  }

  void setIndent(int spaces) {
    state = state.copyWith(indentSpaces: spaces);
    if (state.input.isNotEmpty && !state.minify && state.error == null) format();
  }

  void loadSample() {
    const sampleData = '{"version":1.0,"type":"Web Framework","project":"Jaspr","isAwesome":true,"features":["SSR","CSR","Riverpod"],"nested":{"z":1,"a":2}}';
    state = state.copyWith(input: sampleData, error: null);
    format();
  }

  // NEW: Deeply sorts Maps alphabetically by key
  dynamic _sortJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      final sortedKeys = json.keys.toList()..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
      final sortedMap = <String, dynamic>{};
      for (final key in sortedKeys) {
        sortedMap[key] = _sortJson(json[key]);
      }
      return sortedMap;
    } else if (json is List) {
      return json.map((e) => _sortJson(e)).toList();
    }
    return json;
  }

  void format() {
    if (state.input.trim().isEmpty) {
      state = state.copyWith(output: '', clearError: true);
      return;
    }

    try {
      dynamic parsed = jsonDecode(state.input);
      
      // Apply alphabetical sorting if enabled
      if (state.sortKeys) {
        parsed = _sortJson(parsed);
      }

      final indent = ' ' * state.indentSpaces;
      final output = state.minify
          ? jsonEncode(parsed)
          : JsonEncoder.withIndent(indent).convert(parsed);
          
      state = state.copyWith(output: output, clearError: true);
    } catch (e) {
      final cleanError = e.toString().replaceAll('FormatException: ', '');
      state = state.copyWith(output: '', error: 'Invalid JSON: $cleanError');
    }
  }

  void clear() => state = const JsonFormatterState();
}

final jsonFormatterProvider = NotifierProvider<JsonFormatterProvider, JsonFormatterState>(JsonFormatterProvider.new);