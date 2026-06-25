import 'package:portfolio/register.dart';

@client
class ColorPickerPage extends StatelessComponent {
  const ColorPickerPage({super.key});

  @override
  Component build(BuildContext context) {
    final state = context.watch(colorPickerProvider);
    final notifier = context.read(colorPickerProvider.notifier);

    return div(classes: 'container gap-60', [
      // Banner
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [Component.text('/')]),
          Component.text('Color Picker'),
        ]),
        p(classes: 'hero-subtitle', [
          Component.text('Advanced color tool — pick, convert, generate palettes, gradients, and check contrast.'),
        ]),
      ]),

      section([
        // ── Tab Bar ──────────────────────────────────────────
        div(classes: 'cp-tabs', [
          for (final tab in [
            ('picker', '🎨 Picker'),
            ('palette', '🖌 Palette'),
            ('gradient', '✦ Gradient'),
            ('contrast', '◑ Contrast'),
          ])
            button(
              classes: 'cp-tab${state.activeTab == tab.$1 ? ' cp-tab-active' : ''}',
              onClick: () => notifier.setTab(tab.$1),
              [Component.text(tab.$2)],
            ),
        ]),

        // ── Picker Tab ────────────────────────────────────────
        if (state.activeTab == 'picker') _buildPicker(state, notifier),

        // ── Palette Tab ───────────────────────────────────────
        if (state.activeTab == 'palette') _buildPalette(state, notifier),

        // ── Gradient Tab ──────────────────────────────────────
        if (state.activeTab == 'gradient') _buildGradient(state, notifier),

        // ── Contrast Tab ─────────────────────────────────────
        if (state.activeTab == 'contrast') _buildContrast(state, notifier),
      ]),
    ]);
  }

  // ── Picker ─────────────────────────────────────────────────

  Component _buildPicker(ColorPickerState state, ColorPickerNotifier notifier) {
    return div(classes: 'cp-section', [
      div(classes: 'color-picker-wrap', [

        // Preview column
        div(classes: 'color-preview-col', [
          div(classes: 'color-preview-box', styles: Styles(raw: {'background': state.hex}), []),
          p(classes: 'color-preview-label', [Component.text(state.hex.toUpperCase())]),
          input(
            type: InputType.color,
            value: state.hex,
            classes: 'color-native-picker',
            onChange: (v) => notifier.fromHex(v?.toString() ?? '#000000'),
            // [],
          ),
          // History
          if (state.history.isNotEmpty) ...[
            p(classes: 'tool-editor-label', [Component.text('Recent')]),
            div(classes: 'cp-history', [
              for (final entry in state.history)
                button(
                  classes: 'cp-history-dot',
                  styles: Styles(raw:{'background': entry.hex}),
                  onClick: () => notifier.pickFromHistory(entry),
                  [
                    span(classes: 'cp-history-tooltip', [Component.text(entry.hex.toUpperCase())]),
                  ],
                ),
            ]),
          ],
        ]),

        // Inputs column
        div(classes: 'color-inputs-col', [

          // HEX
          div(classes: 'color-input-group', [
            label(classes: 'tool-editor-label', [Component.text('HEX')]),
            input(
              type: InputType.text,
              value: state.hex,
              classes: 'tool-input',
              onInput: (v) => notifier.fromHex(v?.toString() ?? ''),
              // [],
            ),
            if (state.error != null)
              p(classes: 'tool-error', [Component.text(state.error!)]),
          ]),

          // RGB sliders
          div(classes: 'color-input-group', [
            label(classes: 'tool-editor-label', [Component.text('RGB')]),
            _buildSliderRow('R', state.r, 0, 255, '#e06c75',
                (v) => notifier.fromRgb(v, state.g, state.b)),
            _buildSliderRow('G', state.g, 0, 255, '#98c379',
                (v) => notifier.fromRgb(state.r, v, state.b)),
            _buildSliderRow('B', state.b, 0, 255, '#61afef',
                (v) => notifier.fromRgb(state.r, state.g, v)),
          ]),

          // HSL sliders
          div(classes: 'color-input-group', [
            label(classes: 'tool-editor-label', [Component.text('HSL')]),
            _buildSliderRow('H', state.h.toInt(), 0, 360, 'var(--color-primary)',
                (v) => notifier.fromHsl(v.toDouble(), state.s, state.l)),
            _buildSliderRow('S', state.s.toInt(), 0, 100, 'var(--color-primary)',
                (v) => notifier.fromHsl(state.h, v.toDouble(), state.l)),
            _buildSliderRow('L', state.l.toInt(), 0, 100, 'var(--color-primary)',
                (v) => notifier.fromHsl(state.h, state.s, v.toDouble())),
          ]),

          // CSS values
          div(classes: 'color-input-group', [
            label(classes: 'tool-editor-label', [Component.text('CSS Values — click to copy')]),
            _buildCssChip('HEX', state.hex.toUpperCase()),
            _buildCssChip('RGB', 'rgb(${state.r}, ${state.g}, ${state.b})'),
            _buildCssChip('HSL', 'hsl(${state.h.toInt()}, ${state.s.toInt()}%, ${state.l.toInt()}%)'),
            _buildCssChip('Flutter', 'Color(0xFF${state.hex.substring(1).toUpperCase()})'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildSliderRow(String lbl, int value, int min, int max, String color, void Function(int) onChange) {
    return div(classes: 'cp-slider-row', [
      span(classes: 'cp-slider-label', [Component.text(lbl)]),
      input(
        type: InputType.range,
        value: value.toString(),
        classes: 'cp-slider',
        styles: Styles(raw:{'--slider-color': color}),
        onInput: (v) {
          final n = int.tryParse(v?.toString() ?? '');
          if (n != null) onChange(n);
        },
        // [],
      ),
      input(
        type: InputType.number,
        value: value.toString(),
        classes: 'cp-slider-number',
        onInput: (v) {
          final n = int.tryParse(v?.toString() ?? '');
          if (n != null && n >= min && n <= max) onChange(n);
        },
        // [],
      ),
    ]);
  }

  Component _buildCssChip(String lbl, String value) {
    return div(classes: 'color-css-chip', [
      span(classes: 'color-css-label', [Component.text(lbl)]),
      span(classes: 'color-css-value', [Component.text(value)]),
      // span(classes: 'cp-copy-btn', [Component.text('copy')]),
      AppCopy(value: value),
    ]);
  }

  // ── Palette ────────────────────────────────────────────────

  Component _buildPalette(ColorPickerState state, ColorPickerNotifier notifier) {
    final palette = notifier.getPalette();
    return div(classes: 'cp-section', [
      div(classes: 'cp-palette-controls', [
        for (final mode in PaletteMode.values)
          button(
            classes: 'cp-mode-btn${state.paletteMode == mode ? ' active' : ''}',
            onClick: () => notifier.setPaletteMode(mode),
            [Component.text(_paletteModeLabel(mode))],
          ),
      ]),
      div(classes: 'cp-palette-grid', [
        for (final hex in palette)
          div(classes: 'cp-palette-swatch', [
            div(classes: 'cp-swatch-color', styles: Styles(raw: {'background': hex}), []),
            p(classes: 'cp-swatch-hex', [Component.text(hex.toUpperCase())]),
            button(
              classes: 'cp-swatch-use',
              onClick: () => notifier.fromHex(hex),
              [Component.text('Use')],
            ),
          ]),
      ]),
    ]);
  }

  String _paletteModeLabel(PaletteMode mode) {
    switch (mode) {
      case PaletteMode.complementary: return 'Complementary';
      case PaletteMode.triadic: return 'Triadic';
      case PaletteMode.analogous: return 'Analogous';
      case PaletteMode.shades: return 'Shades';
    }
  }

  // ── Gradient ───────────────────────────────────────────────

  Component _buildGradient(ColorPickerState state, ColorPickerNotifier notifier) {
    final css = notifier.getGradientCss();
    return div(classes: 'cp-section', [
      div(classes: 'cp-gradient-preview', styles: Styles(raw: {'background': css}), []),
      div(classes: 'cp-gradient-controls', [
        // Type toggle
        div(classes: 'cp-gradient-row', [
          span(classes: 'tool-editor-label', [Component.text('Type')]),
          div(classes: 'cp-toggle-group', [
            button(
              classes: 'cp-toggle-btn${state.gradientType == GradientType.linear ? ' active' : ''}',
              onClick: () => notifier.setGradientType(GradientType.linear),
              [Component.text('Linear')],
            ),
            button(
              classes: 'cp-toggle-btn${state.gradientType == GradientType.radial ? ' active' : ''}',
              onClick: () => notifier.setGradientType(GradientType.radial),
              [Component.text('Radial')],
            ),
          ]),
        ]),

        // Angle (only for linear)
        if (state.gradientType == GradientType.linear)
          div(classes: 'cp-gradient-row', [
            span(classes: 'tool-editor-label', [Component.text('Angle: ${state.gradientAngle}°')]),
            input(
              type: InputType.range,
              value: state.gradientAngle.toString(),
              classes: 'cp-slider',
              onInput: (v) => notifier.setGradientAngle(int.tryParse(v ?.toString()?? '') ?? 135),
              // [],
            ),
          ]),

        // Stops
        div(classes: 'cp-gradient-row', [
          span(classes: 'tool-editor-label', [Component.text('Color Stops')]),
          button(
            classes: 'btn-secondary',
            onClick: () => notifier.addGradientStop(),
            [Component.text('+ Add Stop')],
          ),
        ]),
        for (var i = 0; i < state.gradientStops.length; i++)
          div(classes: 'cp-stop-row', [
            input(
              type: InputType.color,
              value: state.gradientStops[i].hex,
              classes: 'color-native-picker',
              onChange: (v) => notifier.updateGradientStop(i, v?.toString() ?? '#000000'),
              // [],
            ),
            span(classes: 'cp-stop-hex', [Component.text(state.gradientStops[i].hex.toUpperCase())]),
            if (state.gradientStops.length > 2)
              button(
                classes: 'cp-remove-btn',
                onClick: () => notifier.removeGradientStop(i),
                [Component.text('✕')],
              ),
          ]),

        // CSS output
        div(classes: 'color-input-group', [
          label(classes: 'tool-editor-label', [Component.text('CSS Output')]),
          div(classes: 'color-css-chip', [
            span(classes: 'color-css-value', [Component.text('background: $css;')]),
            span(classes: 'cp-copy-btn', [Component.text('copy')]),
          ]),
        ]),
      ]),
    ]);
  }

  // ── Contrast ───────────────────────────────────────────────

  Component _buildContrast(ColorPickerState state, ColorPickerNotifier notifier) {
    final ratio = notifier.getContrastRatio();
    final ratioStr = ratio.toStringAsFixed(2);
    final passAA = ratio >= 4.5;
    final passAAA = ratio >= 7.0;
    final passAALarge = ratio >= 3.0;

    return div(classes: 'cp-section', [
      div(classes: 'cp-contrast-wrap', [

        // Color A
        div(classes: 'cp-contrast-col', [
          label(classes: 'tool-editor-label', [Component.text('Color A (current)')]),
          div(classes: 'cp-contrast-swatch', styles: Styles(raw: {'background': state.hex}), [
            span(styles: Styles(raw: {'color': state.contrastHex}), [Component.text('Aa')]),
          ]),
          p(classes: 'color-preview-label', [Component.text(state.hex.toUpperCase())]),
        ]),

        // Ratio display
        div(classes: 'cp-contrast-ratio', [
          span(classes: 'cp-ratio-number', [Component.text(ratioStr)]),
          span(classes: 'cp-ratio-label', [Component.text(':1')]),
        ]),

        // Color B
        div(classes: 'cp-contrast-col', [
          label(classes: 'tool-editor-label', [Component.text('Color B (background)')]),
          div(classes: 'cp-contrast-swatch', styles: Styles(raw: {'background': state.contrastHex}), [
            span(styles: Styles(raw: {'color': state.hex}), [Component.text('Aa')]),
          ]),
          input(
            type: InputType.color,
            value: state.contrastHex,
            classes: 'color-native-picker',
            onChange: (v) => notifier.setContrastHex(v?.toString() ?? '#000000'),
            // [],
          ),
        ]),
      ]),

      // WCAG results
      div(classes: 'cp-wcag-grid', [
        _buildWcagBadge('AA Normal', passAA, '≥4.5:1'),
        _buildWcagBadge('AA Large', passAALarge, '≥3.0:1'),
        _buildWcagBadge('AAA Normal', passAAA, '≥7.0:1'),
        _buildWcagBadge('AAA Large', ratio >= 4.5, '≥4.5:1'),
      ]),

      // Preview text
      div(classes: 'cp-contrast-preview', styles: Styles(raw: {
        'background': state.contrastHex,
        'color': state.hex,
      }), [
        p([Component.text('The quick brown fox jumps over the lazy dog.')]),
        p(styles: Styles(raw: {'font-size': '24px'}), [Component.text('Large Text Preview')]),
      ]),
    ]);
  }

  Component _buildWcagBadge(String label, bool pass, String threshold) {
    return div(classes: 'cp-wcag-badge${pass ? ' pass' : ' fail'}', [
      span(classes: 'cp-wcag-label', [Component.text(label)]),
      span(classes: 'cp-wcag-status', [Component.text(pass ? '✓ Pass' : '✕ Fail')]),
      span(classes: 'cp-wcag-threshold', [Component.text(threshold)]),
    ]);
  }
}