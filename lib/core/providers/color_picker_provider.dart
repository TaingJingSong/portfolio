import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'dart:math';

enum PaletteMode { complementary, triadic, analogous, shades }
enum GradientType { linear, radial }

class ColorEntry {
  final String hex;
  final int r, g, b;
  const ColorEntry({required this.hex, required this.r, required this.g, required this.b});
}

class GradientStop {
  final String hex;
  final int position;
  const GradientStop({required this.hex, required this.position});
}

class ColorPickerState {
  final String hex;
  final int r, g, b;
  final double h, s, l;
  final String? error;
  final List<ColorEntry> history;
  final PaletteMode paletteMode;
  final GradientType gradientType;
  final int gradientAngle;
  final List<GradientStop> gradientStops;
  final String contrastHex;
  final String activeTab; // 'picker' | 'palette' | 'gradient' | 'contrast'

  const ColorPickerState({
    this.hex = '#c778dd',
    this.r = 199, this.g = 120, this.b = 221,
    this.h = 288, this.s = 60, this.l = 67,
    this.error,
    this.history = const [],
    this.paletteMode = PaletteMode.complementary,
    this.gradientType = GradientType.linear,
    this.gradientAngle = 135,
    this.gradientStops = const [
      GradientStop(hex: '#c778dd', position: 0),
      GradientStop(hex: '#3b82f6', position: 100),
    ],
    this.contrastHex = '#282c33',
    this.activeTab = 'picker',
  });

  ColorPickerState copyWith({
    String? hex, int? r, int? g, int? b,
    double? h, double? s, double? l,
    String? error, bool clearError = false,
    List<ColorEntry>? history,
    PaletteMode? paletteMode,
    GradientType? gradientType,
    int? gradientAngle,
    List<GradientStop>? gradientStops,
    String? contrastHex,
    String? activeTab,
  }) => ColorPickerState(
    hex: hex ?? this.hex,
    r: r ?? this.r, g: g ?? this.g, b: b ?? this.b,
    h: h ?? this.h, s: s ?? this.s, l: l ?? this.l,
    error: clearError ? null : error ?? this.error,
    history: history ?? this.history,
    paletteMode: paletteMode ?? this.paletteMode,
    gradientType: gradientType ?? this.gradientType,
    gradientAngle: gradientAngle ?? this.gradientAngle,
    gradientStops: gradientStops ?? this.gradientStops,
    contrastHex: contrastHex ?? this.contrastHex,
    activeTab: activeTab ?? this.activeTab,
  );
}

class ColorPickerNotifier extends Notifier<ColorPickerState> {
  @override
  ColorPickerState build() => const ColorPickerState();

  // ── Core color setters ─────────────────────────────────────

  void fromHex(String hex) {
    try {
      var clean = hex.trim();
      if (clean.startsWith('#')) {
        clean = clean.substring(1);
      }
      
      // If it contains non-hex characters, flag as error
      final hexRegex = RegExp(r'^[0-9a-fA-F]*$');
      if (!hexRegex.hasMatch(clean)) {
        state = state.copyWith(error: 'Invalid characters in hex');
        return;
      }

      if (clean.length != 3 && clean.length != 6) {
        // While user is typing partial hex, update raw text without breaking layout or showing validation errors
        state = state.copyWith(hex: hex, error: null);
        return;
      }

      int r, g, b;
      String fullHex;
      if (clean.length == 3) {
        final rChar = clean.substring(0, 1);
        final gChar = clean.substring(1, 2);
        final bChar = clean.substring(2, 3);
        r = int.parse(rChar + rChar, radix: 16);
        g = int.parse(gChar + gChar, radix: 16);
        b = int.parse(bChar + bChar, radix: 16);
        fullHex = '#$rChar$rChar$gChar$gChar$bChar$bChar'.toLowerCase();
      } else {
        r = int.parse(clean.substring(0, 2), radix: 16);
        g = int.parse(clean.substring(2, 4), radix: 16);
        b = int.parse(clean.substring(4, 6), radix: 16);
        fullHex = '#${clean.toLowerCase()}';
      }

      final hsl = _rgbToHsl(r, g, b);
      _updateColor(fullHex, r, g, b, hsl[0], hsl[1], hsl[2]);
    } catch (_) {
      state = state.copyWith(error: 'Invalid hex color');
    }
  }

  void fromRgb(int r, int g, int b) {
    final hex = '#${_toHex(r)}${_toHex(g)}${_toHex(b)}';
    final hsl = _rgbToHsl(r, g, b);
    _updateColor(hex, r, g, b, hsl[0], hsl[1], hsl[2]);
  }

  void fromHsl(double h, double s, double l) {
    final rgb = _hslToRgb(h, s, l);
    final hex = '#${_toHex(rgb[0])}${_toHex(rgb[1])}${_toHex(rgb[2])}';
    _updateColor(hex, rgb[0], rgb[1], rgb[2], h, s, l);
  }

  void _updateColor(String hex, int r, int g, int b, double h, double s, double l) {
    final entry = ColorEntry(hex: hex, r: r, g: g, b: b);
    final history = [entry, ...state.history.where((e) => e.hex != hex)].take(10).toList();
    state = state.copyWith(hex: hex, r: r, g: g, b: b, h: h, s: s, l: l, clearError: true, history: history);
  }

  void pickFromHistory(ColorEntry entry) => fromHex(entry.hex);

  // ── Tab ────────────────────────────────────────────────────

  void setTab(String tab) => state = state.copyWith(activeTab: tab);

  // ── Palette ────────────────────────────────────────────────

  void setPaletteMode(PaletteMode mode) => state = state.copyWith(paletteMode: mode);

  List<String> getPalette() {
    switch (state.paletteMode) {
      case PaletteMode.complementary:
        return [
          state.hex,
          _hslToHex((state.h + 180) % 360, state.s, state.l),
          _hslToHex((state.h + 30) % 360, state.s, state.l),
          _hslToHex((state.h + 210) % 360, state.s, state.l),
        ];
      case PaletteMode.triadic:
        return [
          state.hex,
          _hslToHex((state.h + 120) % 360, state.s, state.l),
          _hslToHex((state.h + 240) % 360, state.s, state.l),
          _hslToHex((state.h + 60) % 360, state.s, state.l),
        ];
      case PaletteMode.analogous:
        return [
          _hslToHex((state.h - 40) % 360, state.s, state.l),
          _hslToHex((state.h - 20) % 360, state.s, state.l),
          state.hex,
          _hslToHex((state.h + 20) % 360, state.s, state.l),
          _hslToHex((state.h + 40) % 360, state.s, state.l),
        ];
      case PaletteMode.shades:
        return [10, 25, 40, 55, 70, 85]
            .map((l) => _hslToHex(state.h, state.s, l.toDouble()))
            .toList();
    }
  }

  // ── Gradient ───────────────────────────────────────────────

  void setGradientType(GradientType type) => state = state.copyWith(gradientType: type);
  void setGradientAngle(int angle) => state = state.copyWith(gradientAngle: angle);

  void updateGradientStop(int index, String hex) {
    final stops = [...state.gradientStops];
    stops[index] = GradientStop(hex: hex, position: stops[index].position);
    state = state.copyWith(gradientStops: stops);
  }

  void addGradientStop() {
    final stops = [...state.gradientStops, GradientStop(hex: state.hex, position: 50)];
    state = state.copyWith(gradientStops: stops);
  }

  void removeGradientStop(int index) {
    if (state.gradientStops.length <= 2) return;
    final stops = [...state.gradientStops]..removeAt(index);
    state = state.copyWith(gradientStops: stops);
  }

  String getGradientCss() {
    final stops = state.gradientStops.map((s) => '${s.hex} ${s.position}%').join(', ');
    if (state.gradientType == GradientType.radial) {
      return 'radial-gradient(circle, $stops)';
    }
    return 'linear-gradient(${state.gradientAngle}deg, $stops)';
  }

  // ── Contrast ───────────────────────────────────────────────

  void setContrastHex(String hex) {
    try {
      final clean = hex.startsWith('#') ? hex.substring(1) : hex;
      if (clean.length == 6) state = state.copyWith(contrastHex: '#$clean');
    } catch (_) {}
  }

  double getContrastRatio() {
    final l1 = _relativeLuminance(state.r, state.g, state.b);
    final contrastRgb = _hexToRgb(state.contrastHex);
    final l2 = _relativeLuminance(contrastRgb[0], contrastRgb[1], contrastRgb[2]);
    final lighter = max(l1, l2);
    final darker = min(l1, l2);
    return (lighter + 0.05) / (darker + 0.05);
  }

  double _relativeLuminance(int r, int g, int b) {
    double linearize(int c) {
      final s = c / 255;
      return s <= 0.03928 ? s / 12.92 : pow((s + 0.055) / 1.055, 2.4).toDouble();
    }
    return 0.2126 * linearize(r) + 0.7152 * linearize(g) + 0.0722 * linearize(b);
  }

  List<int> _hexToRgb(String hex) {
    final clean = hex.startsWith('#') ? hex.substring(1) : hex;
    return [
      int.parse(clean.substring(0, 2), radix: 16),
      int.parse(clean.substring(2, 4), radix: 16),
      int.parse(clean.substring(4, 6), radix: 16),
    ];
  }

  // ── Helpers ────────────────────────────────────────────────

  String _toHex(int v) => v.toRadixString(16).padLeft(2, '0');

  String _hslToHex(double h, double s, double l) {
    final rgb = _hslToRgb(h, s, l);
    return '#${_toHex(rgb[0])}${_toHex(rgb[1])}${_toHex(rgb[2])}';
  }

  List<double> _rgbToHsl(int r, int g, int b) {
    final rf = r / 255, gf = g / 255, bf = b / 255;
    final mx = [rf, gf, bf].reduce(max);
    final mn = [rf, gf, bf].reduce(min);
    final l = (mx + mn) / 2;
    if (mx == mn) return [0, 0, l * 100];
    final d = mx - mn;
    final s = l > 0.5 ? d / (2 - mx - mn) : d / (mx + mn);
    double h;
    if (mx == rf) {
      h = (gf - bf) / d + (gf < bf ? 6 : 0);
    } else if (mx == gf) {
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
    return [((rf + m) * 255).round(), ((gf + m) * 255).round(), ((bf + m) * 255).round()];
  }
}

final colorPickerProvider = NotifierProvider<ColorPickerNotifier, ColorPickerState>(
  ColorPickerNotifier.new,
);