import 'package:portfolio/register.dart'; 

@client
class JsonFormatterPage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final state = context.watch(jsonFormatterProvider);
    final notifier = context.read(jsonFormatterProvider.notifier);
    
    return div(classes: 'container gap-60', [
      // Banner
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [AppText(text: '/')]),
          AppText(text: 'json-formatter'),
        ]),
        p(classes: 'hero-subtitle', [
          AppText(text: 'format-validate-minify-and-sort-json-data.'),
        ]),
      ]),

      section([
        // Top Controls Bar
        div(classes: 'tool-controls', [
          label(classes: 'tool-checkbox-label', [
            input(
              classes: 'input',
              type: InputType.checkbox,
              checked: state.autoFormat,
              onChange: (_) => notifier.toggleAutoFormat(),
            ),
            span(classes: 'custom-checkbox', []),
            AppText(text: 'Auto-format'),
          ]),
          
          label(classes: 'tool-checkbox-label', [
            input(
              classes: 'input',
              type: InputType.checkbox,
              checked: state.minify,
              onChange: (_) => notifier.toggleMinify(),
            ),
            span(classes: 'custom-checkbox', []),
            AppText(text: 'Minify'),
          ]),

          label(classes: 'tool-checkbox-label', [
            input(
              classes: 'input',
              type: InputType.checkbox,
              checked: state.sortKeys,
              onChange: (_) => notifier.toggleSortKeys(),
            ),
            span(classes: 'custom-checkbox', []),
            AppText(text: 'A-Z Sort'), 
          ]),

          select(
            classes: 'tool-select',
            onChange: (val) => notifier.setIndent(int.parse(val.firstOrNull ?? '')),
            [
              option(value: '2', selected: state.indentSpaces == 2, [AppText(text: '2 Spaces')]),
              option(value: '4', selected: state.indentSpaces == 4, [AppText(text: '4 Spaces')]),
            ]
          ),

          if (!state.autoFormat)
            button(
              classes: 'btn-primary',
              onClick: () => notifier.format(),
              [AppText(text: 'Format')],
            ),

          button(
            classes: 'btn-secondary',
            onClick: () => notifier.loadSample(),
            [AppText(text: 'Sample Data')],
          ),

          button(
            classes: 'btn-secondary',
            onClick: () => notifier.clear(),
            [AppText(text: 'Clear')],
          ),
        ]),

        div(classes: 'tool-editor-wrap', [
          
          div(classes: 'tool-editor-col tool-relative', [
            div(classes: 'tool-editor-header', [
              span(classes: 'tool-editor-label', [AppText(text: 'Input')]),
              div(classes: 'tool-header-actions',[
                AppCopy(value: state.input),
                AppDownload(value: state.input),
              ])
            ]),
            
            textarea(
              classes: 'tool-textarea ${state.error != null ? 'tool-textarea-error' : ''}',
              placeholder: 'Paste your JSON here...',
              onInput: (val) => notifier.setInput(val),
              [AppText(text: state.input)], 
            ),
            
            if (state.error != null)
              p(classes: 'tool-error', [AppText(text: state.error!)]),
          ]),

          div(classes: 'tool-editor-col tool-relative', [
            div(classes: 'tool-editor-header', [
              p(classes: 'tool-editor-label', [AppText(text: 'Output')]),
              div(classes: 'tool-header-actions', [
                span(classes: 'tool-stats', [AppText(text: state.outputStats)]),
                AppCopy(value: state.output),
                AppDownload(value: state.output),
              ]),
            ]),

            textarea(
              classes: 'tool-textarea tool-textarea-readonly',
              placeholder: 'Formatted JSON will appear here...',
              readonly: true,
              [AppText(text: state.output)], 
            ),
          ]),
          
        ]),
      ]),
    ]);
  }
}