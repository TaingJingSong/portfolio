import 'package:portfolio/register.dart';

@client
class ToolsPage extends StatelessComponent {
  const ToolsPage({super.key});

  @override
  Component build(BuildContext context) {
    final categories = tools.map((t) => t.category).toSet().toList();

    return div(classes: 'container gap-60', [
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [Component.text('/')]),
          Component.text('tools'),
        ]),
        p(classes: 'hero-subtitle', [
          Component.text('A collection of dev tools built for everyday use.'.slashStyle),
        ]),
      ]),

      for (final category in categories)
        section([
          div(classes: 'section-header', [
            h2(classes: 'section-title', [
              span([Component.text('#')]),
              Component.text(category),
            ]),
            div(classes: 'section-line', []),
          ]),
          div(classes: 'tools-grid', [
            for (final tool in tools.where((t) => t.category == category))
              Link(
                to: '/tool/${tool.slug}',
                child: div(classes: 'tool-card', [
                  div(classes: 'tool-card-icon', [Component.text(tool.icon)]),
                  div(classes: 'tool-card-info', [
                    h3(classes: 'tool-card-title', [Component.text(tool.name)]),
                    p(classes: 'tool-card-desc', [Component.text(tool.description)]),
                  ]),
                ]),
              ),
          ]),
        ]),
    ]);
  }
}