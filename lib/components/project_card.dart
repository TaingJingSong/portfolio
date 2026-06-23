import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/model/project_model.dart';

class ProjectCard extends StatelessComponent {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  Component build(BuildContext context) {
    return div(classes: 'project-card', [
      img(src: project.imagePath, classes: 'project-card-img', alt: project.title),
      div(classes: 'project-card-info', [
        h3(classes: 'project-card-title', [Component.text(project.title)]),
        p(classes: 'project-card-desc', [Component.text(project.desc)]),
        div(classes: 'project-card-links', [
          for (final link in project.links)
            a(
              href: link.link,
              target: Target.blank,
              classes: 'btn-primary',
              [
                if (link.iconPath != null)
                  img(
                    src: link.iconPath!,
                    width: 14,
                    styles: Styles(margin: Margin.only(right: 6.px)),
                    alt: link.title,
                  )
                else if (link.icon != null)
                  span(
                    styles: Styles(color: Colors.white, fontSize: 10.px).combine(
                      Styles(margin: Margin.only(right: 6.px)),
                    ),
                    [Component.text(link.icon!)],
                  ),
                Component.text(link.title),
              ],
            ),
        ]),
      ]),
    ]);
  }
}
