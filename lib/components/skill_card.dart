import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

@client
class SkillCard extends StatelessComponent {
  final String title;
  final List<String> skills;

  const SkillCard({
    super.key, 
    required this.title, 
    required this.skills,
  });

  @override
  Component build(BuildContext context) {
    return article(
      classes: 'skill-card',
      [
        h3(classes: 'skill-card-title', [Component.text(title)]),
        div(classes: 'skill-card-list', [
          for (final skill in skills)
            span(classes: 'skill-badge', [Component.text(skill)]),
        ]),
      ],
    );
  }
}