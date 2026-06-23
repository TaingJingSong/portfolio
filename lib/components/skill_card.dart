import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class SkillCard extends StatelessComponent {
  final String title;
  final List<String> skills;

  const SkillCard({super.key, required this.title, required this.skills});

  @override
  Component build(BuildContext context) {
    return div(classes: 'skill-card', [
      div(classes: 'skill-card-title', [Component.text(title)]),
      div(classes: 'skill-card-list', [
        for (final skill in skills)
          span([Component.text(skill)]),
      ]),
    ]);
  }
}
