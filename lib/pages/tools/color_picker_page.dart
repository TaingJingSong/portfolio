import 'package:portfolio/register.dart';

@client
class ColorPickerPage extends StatelessComponent {
  const ColorPickerPage({super.key});

  @override
  Component build(BuildContext context) {
    final state = context.watch(colorPickerProvider);
    final notifier = context.read(colorPickerProvider.notifier);

    return div(classes: 'container gap-60', [
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [Component.text('/')]),
          AppText(text: 'Color Picker'.slashStyle),
        ]),
        p(classes: 'hero-subtitle', [
          AppText(text: 'Pick a color and convert between HEX, RGB, and HSL.'.slashStyle),
        ]),
      ]),

      section([
        div(classes: 'color-picker-wrap', [

          // Preview
          div(classes: 'color-preview-col', [
            div(
              classes: 'color-preview-box',
              styles: Styles(raw: {'background': state.hex}),
              [],
            ),
            p(classes: 'color-preview-label', [
              AppText(text: state.hex.toUpperCase()),
            ]),
          ]),

          // Inputs
          div(classes: 'color-inputs-col', [

            // Native color picker
            div(classes: 'color-input-group', [
              label(classes: 'tool-editor-label', [AppText(text: 'Pick')]),
              input<String?>(
                type: InputType.color,
                value: state.hex,
                classes: 'color-native-picker',
                onChange: (v) => notifier.fromHex(v ?? '#000000'),
              ),
            ]),

            // HEX
            div(classes: 'color-input-group', [
              label(classes: 'tool-editor-label', [AppText(text: 'HEX')]),
              input<String?>(
                type: InputType.text,
                value: state.hex,
                classes: 'tool-input',
                onInput: (v) => notifier.fromHex(v ?? ''),
              ),
              if (state.error != null)
                p(classes: 'tool-error', [AppText(text: state.error!)]),
            ]),

            // RGB
            div(classes: 'color-input-group', [
              label(classes: 'tool-editor-label', [AppText(text: 'RGB')]),
              div(classes: 'color-rgb-row', [
                _buildNumberInput('R', state.r, 0, 255,
                    (v) => notifier.fromRgb(v, state.g, state.b)),
                _buildNumberInput('G', state.g, 0, 255,
                    (v) => notifier.fromRgb(state.r, v, state.b)),
                _buildNumberInput('B', state.b, 0, 255,
                    (v) => notifier.fromRgb(state.r, state.g, v)),
              ]),
            ]),

            // HSL
            div(classes: 'color-input-group', [
              label(classes: 'tool-editor-label', [AppText(text: 'HSL')]),
              div(classes: 'color-rgb-row', [
                _buildNumberInput('H', state.h.toInt(), 0, 360,
                    (v) => notifier.fromHsl(v.toDouble(), state.s, state.l)),
                _buildNumberInput('S', state.s.toInt(), 0, 100,
                    (v) => notifier.fromHsl(state.h, v.toDouble(), state.l)),
                _buildNumberInput('L', state.l.toInt(), 0, 100,
                    (v) => notifier.fromHsl(state.h, state.s, v.toDouble())),
              ]),
            ]),

            // CSS Output
            div(classes: 'color-input-group', [
              label(classes: 'tool-editor-label', [AppText(text: 'CSS')]),
              div(classes: 'color-css-outputs', [
                _buildCssChip('hex', state.hex.toUpperCase()),
                _buildCssChip('rgb', 'rgb(${state.r}, ${state.g}, ${state.b})'),
                _buildCssChip('hsl',
                    'hsl(${state.h.toInt()}, ${state.s.toInt()}%, ${state.l.toInt()}%)'),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildNumberInput(
      String lbl, int value, int min, int max, void Function(int) onChange) {
    return div(classes: 'color-number-input', [
      span(classes: 'color-number-label', [AppText(text: lbl)]),
      input<String?>(
        type: InputType.number,
        value: value.toString(),
        classes: 'tool-input',
        onInput: (v) {
          final n = int.tryParse(v ?? '');
          if (n != null && n >= min && n <= max) onChange(n);
        },
      ),
    ]);
  }

  Component _buildCssChip(String lbl, String value) {
    return div(classes: 'color-css-chip', [
      span(classes: 'color-css-label', [AppText(text: lbl)]),
      span(classes: 'color-css-value', [AppText(text: value)]),
    ]);
  }
}