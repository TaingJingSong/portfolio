import 'package:jaspr_riverpod/jaspr_riverpod.dart';

class ColorPickerState {
  final String hex;
  final int r;
  final int g;
  final int b;
  final double h;
  final double s;
  final double l;
  final String? error;

  const ColorPickerState({
    this.hex = '#c778dd',
    this.r = 199,
    this.g = 120,
    this.b = 221,
    this.h = 288,
    this.s = 60,
    this.l = 67,
    this.error,
  });

  ColorPickerState copyWith({
    String? hex,
    int? r, int? g, int? b,
    double? h, double? s, double? l,
    String? error,
    bool clearError = false,
  }) {
    return ColorPickerState(
      hex: hex ?? this.hex,
      r: r ?? this.r,
      g: g ?? this.g,
      b: b ?? this.b,
      h: h ?? this.h,
      s: s ?? this.s,
      l: l ?? this.l,
      error: clearError ? null : error ?? this.error,
    );
  }
}

class ColorPickerNotifier extends Notifier<ColorPickerState> {
  @override
  ColorPickerState build() => const ColorPickerState();

  void fromHex(String hex) {
    try {
      final clean = hex.startsWith('#') ? hex.substring(1) : hex;
      if (clean.length != 6) throw Exception('Invalid hex');
      final r = int.parse(clean.substring(0, 2), radix: 16);
      final g = int.parse(clean.substring(2, 4), radix: 16);
      final b = int.parse(clean.substring(4, 6), radix: 16);
      final hsl = _rgbToHsl(r, g, b);
      state = state.copyWith(
        hex: '#$clean',
        r: r, g: g, b: b,
        h: hsl[0], s: hsl[1], l: hsl[2],
        clearError: true,
      );
    } catch (e) {
      state = state.copyWith(error: 'Invalid hex color');
    }
  }

  void fromRgb(int r, int g, int b) {
    final hex = '#${_toHex(r)}${_toHex(g)}${_toHex(b)}';
    final hsl = _rgbToHsl(r, g, b);
    state = state.copyWith(
      hex: hex, r: r, g: g, b: b,
      h: hsl[0], s: hsl[1], l: hsl[2],
      clearError: true,
    );
  }

  void fromHsl(double h, double s, double l) {
    final rgb = _hslToRgb(h, s, l);
    final hex = '#${_toHex(rgb[0])}${_toHex(rgb[1])}${_toHex(rgb[2])}';
    state = state.copyWith(
      hex: hex,
      r: rgb[0], g: rgb[1], b: rgb[2],
      h: h, s: s, l: l,
      clearError: true,
    );
  }

  String _toHex(int value) => value.toRadixString(16).padLeft(2, '0');

  List<double> _rgbToHsl(int r, int g, int b) {
    final rf = r / 255, gf = g / 255, bf = b / 255;
    final max = [rf, gf, bf].reduce((a, b) => a > b ? a : b);
    final min = [rf, gf, bf].reduce((a, b) => a < b ? a : b);
    final l = (max + min) / 2;
    if (max == min) return [0, 0, l * 100];
    final d = max - min;
    final s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
    double h;
    if (max == rf) {
      h = (gf - bf) / d + (gf < bf ? 6 : 0);
    } else if (max == gf) {
      h = (bf - rf) / d + 2;
    } else {
      h = (rf - gf) / d + 4;
    }
    return [(h / 6 * 360).roundToDouble(), (s * 100).roundToDouble(), (l * 100).roundToDouble()];
  }

  List<int> _hslToRgb(double h, double s, double l) {
    final sf = s / 100, lf = l / 100;
    final c = (1 - (2 * lf - 1).abs()) * sf;
    final x = c * (1 - ((h / 60) % 2 - 1).abs());
    final m = lf - c / 2;
    double rf, gf, bf;
    if (h < 60) { rf = c; gf = x; bf = 0; }
    else if (h < 120) { rf = x; gf = c; bf = 0; }
    else if (h < 180) { rf = 0; gf = c; bf = x; }
    else if (h < 240) { rf = 0; gf = x; bf = c; }
    else if (h < 300) { rf = x; gf = 0; bf = c; }
    else { rf = c; gf = 0; bf = x; }
    return [
      ((rf + m) * 255).round(),
      ((gf + m) * 255).round(),
      ((bf + m) * 255).round(),
    ];
  }
}

final colorPickerProvider = NotifierProvider<ColorPickerNotifier, ColorPickerState>(ColorPickerNotifier.new);