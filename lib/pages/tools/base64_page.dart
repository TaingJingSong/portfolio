import 'package:portfolio/register.dart';

@client
class Base64Page extends StatelessComponent {
  const Base64Page({super.key});

  @override
  Component build(BuildContext context) {
    final state = context.watch(base64Provider);
    final notifier = context.read(base64Provider.notifier);

    return div(classes: 'container gap-60', [
      // Banner
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [Component.text('/')]),
          Component.text('Base64'),
        ]),
        p(classes: 'hero-subtitle', [
          Component.text('Encode and decode Base64 strings — with URL-safe variant, line wrapping, image preview, and more.'),
        ]),
      ]),

      section([
        // ── Mode toggle ──────────────────────────────────────
        div(classes: 'b64-mode-bar', [
          button(
            classes: 'b64-mode-btn${state.mode == Base64Mode.encode ? ' active' : ''}',
            onClick: () => notifier.setMode(Base64Mode.encode),
            [
              span(classes: 'b64-mode-icon', [Component.text('⇡')]),
              Component.text('Encode'),
            ],
          ),
          button(
            classes: 'b64-swap-btn',
            onClick: () => notifier.swapInputOutput(),
            [Component.text('⇄ Swap')],
          ),
          button(
            classes: 'b64-mode-btn${state.mode == Base64Mode.decode ? ' active' : ''}',
            onClick: () => notifier.setMode(Base64Mode.decode),
            [
              span(classes: 'b64-mode-icon', [Component.text('⇣')]),
              Component.text('Decode'),
            ],
          ),
        ]),

        // ── Options bar ──────────────────────────────────────
        div(classes: 'b64-options-bar', [
          // Variant
          div(classes: 'b64-option-group', [
            span(classes: 'b64-option-label', [Component.text('Variant')]),
            div(classes: 'cp-toggle-group', [
              button(
                classes: 'cp-toggle-btn${state.variant == Base64Variant.standard ? ' active' : ''}',
                onClick: () => notifier.setVariant(Base64Variant.standard),
                [Component.text('Standard')],
              ),
              button(
                classes: 'cp-toggle-btn${state.variant == Base64Variant.urlSafe ? ' active' : ''}',
                onClick: () => notifier.setVariant(Base64Variant.urlSafe),
                [Component.text('URL-safe')],
              ),
            ]),
          ]),

          // Wrap lines (encode only)
          if (state.mode == Base64Mode.encode)
            label(classes: 'tool-checkbox-label', [
              input(
                classes: 'input',
                type: InputType.checkbox,
                checked: state.wrapLines,
                onChange: (_) => notifier.toggleWrapLines(),
              ),
              span(classes: 'custom-checkbox', []),
              Component.text('Wrap at 76 chars (MIME)'),
            ]),

          // Strip whitespace (decode only)
          if (state.mode == Base64Mode.decode)
            label(classes: 'tool-checkbox-label', [
              input(
                classes: 'input',
                type: InputType.checkbox,
                checked: state.stripWhitespace,
                onChange: (_) => notifier.toggleStripWhitespace(),
              ),
              span(classes: 'custom-checkbox', []),
              Component.text('Strip whitespace before decoding'),
            ]),

          // Auto process
          label(classes: 'tool-checkbox-label', [
            input(
              classes: 'input',
              type: InputType.checkbox,
              checked: state.autoProcess,
              onChange: (_) => notifier.toggleAutoProcess(),
            ),
            span(classes: 'custom-checkbox', []),
            Component.text('Auto process'),
          ]),

          // Clear
          button(
            classes: 'btn-secondary',
            onClick: () => notifier.clear(),
            [Component.text('Clear')],
          ),

          if (!state.autoProcess)
            button(
              classes: 'btn-primary',
              onClick: () => notifier.process(),
              [Component.text(state.mode == Base64Mode.encode ? 'Encode' : 'Decode')],
            ),
        ]),

        // ── Validation badge (decode mode) ───────────────────
        if (state.mode == Base64Mode.decode && state.input.isNotEmpty)
          div(classes: 'b64-validation-bar', [
            div(
              classes: 'b64-validity-badge${notifier.inputIsValidBase64 ? ' valid' : ' invalid'}',
              [
                Component.text(notifier.inputIsValidBase64 ? '✓ Valid Base64' : '✕ Invalid Base64'),
              ],
            ),
          ]),

        // ── Editor ───────────────────────────────────────────
        div(classes: 'tool-editor-wrap', [
          // Input
          div(classes: 'tool-editor-col tool-relative', [
            div(classes: 'tool-editor-header', [
              p(classes: 'tool-editor-label', [
                Component.text(state.mode == Base64Mode.encode ? 'Plain Text' : 'Base64 Input'),
              ]),
              div(classes: 'tool-header-actions', [
                span(classes: 'tool-stats', [
                  Component.text('${state.inputBytes} bytes'),
                ]),
              ]),
            ]),
            textarea(
              classes: 'tool-textarea${state.error != null ? ' tool-textarea-error' : ''}',
              placeholder: 'Type or paste content here...',
              autofocus: true,
              onInput: (v) => notifier.setInput(v),
              [Component.text(state.input)],
            ),
            if (state.input.isNotEmpty) AppCopy(value: state.input),
          ]),

          // Output
          div(classes: 'tool-editor-col tool-relative', [
            div(classes: 'tool-editor-header', [
              p(classes: 'tool-editor-label', [
                Component.text(state.mode == Base64Mode.encode ? 'Base64 Output' : 'Decoded Text'),
              ]),
              div(classes: 'tool-header-actions', [
                span(classes: 'tool-stats', [
                  Component.text('${state.outputBytes} ${state.mode == Base64Mode.encode ? 'chars' : 'bytes'}'),
                ]),
              ]),
            ]),
            textarea(
              classes: 'tool-textarea',
              placeholder: 'Output will appear here...',
              readonly: true,
              [Component.text(state.error != null ? '' : state.output)],
            ),
            if (state.output.isNotEmpty && state.error == null)
              AppCopy(value: state.output),
          ]),
        ]),

        // ── Error ────────────────────────────────────────────
        if (state.error != null)
          div(classes: 'b64-error-bar', [
            p(classes: 'tool-error', [Component.text(state.error!)]),
          ]),

        // ── Stats bar ────────────────────────────────────────
        if (state.input.isNotEmpty && state.error == null)
          div(classes: 'b64-stats-bar', [
            span(classes: 'b64-stats-text', [Component.text(notifier.stats)]),
          ]),

        // ── Image preview ────────────────────────────────────
        if (state.isImageDataUrl && state.imageDataUrl != null)
          div(classes: 'b64-image-preview', [
            p(classes: 'tool-editor-label', [Component.text('Image Preview')]),
            img(
              src: state.imageDataUrl!,
              classes: 'b64-preview-img',
              alt: 'Decoded image preview',
            ),
          ]),

        // ── Quick reference ──────────────────────────────────
        div(classes: 'b64-reference', [
          p(classes: 'tool-editor-label', [Component.text('Quick Reference')]),
          div(classes: 'b64-ref-grid', [
            _buildRefCard('Standard Base64', 'Uses A-Z, a-z, 0-9, +, /\nPadded with = to multiple of 4'),
            _buildRefCard('URL-safe Base64', 'Uses - instead of +\nUses _ instead of /\nSafe for URLs and filenames'),
            _buildRefCard('MIME (76-char wrap)', 'Used in email attachments\nLine break every 76 characters'),
            _buildRefCard('Size overhead', 'Base64 is ~33% larger\n3 bytes → 4 Base64 chars'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildRefCard(String title, String body) {
    return div(classes: 'b64-ref-card', [
      p(classes: 'b64-ref-title', [Component.text(title)]),
      p(classes: 'b64-ref-body', [Component.text(body)]),
    ]);
  }
}