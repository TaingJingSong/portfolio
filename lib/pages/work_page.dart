import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/language/translation_extension.dart';
import 'package:portfolio/data/project.dart';
import 'package:portfolio/components/project_card.dart';

@client
class WorkPage extends StatelessComponent {
  const WorkPage({super.key});

  @override
  Component build(BuildContext context) {
    final completed = projects.where((proj) => proj.isCompleted).toList();
    final ongoing = projects.where((proj) => !proj.isCompleted).toList();

    return div(classes: 'container gap-60', [
      // Banner
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [Component.text('/')]),
          Component.text('projects'.tr(context)),
        ]),
        p(classes: 'hero-subtitle', [
          Component.text('list-of-my-projects'.tr(context)),
        ]),
      ]),

      // Completed Projects
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('completed-projects'.tr(context)),
          ]),
          div(classes: 'section-line', []),
        ]),
        div(classes: 'project-grid', [
          for (final project in completed)
            ProjectCard(project: project),
        ]),
      ]),

      // Ongoing Projects
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('on-going'.tr(context)),
          ]),
          div(classes: 'section-line', []),
        ]),
        div(classes: 'project-grid', [
          for (final project in ongoing)
            ProjectCard(project: project),
        ]),
      ]),
    ]);
  }
}
