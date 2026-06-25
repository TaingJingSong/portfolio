import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:portfolio/data/skill.dart';

class SkillCard extends StatelessComponent {
  final String title;
  final List<Skill> skills;

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
            div(
              classes: 'skill-badge-wrapper',
              [
                span(
                  classes: 'skill-badge',
                  styles: Styles(raw: {'--skill-level': '${skill.level}%'}),
                  [
                    span(classes: 'skill-name', [Component.text(skill.name)]),
                    span(classes: 'skill-level-text', [Component.text('${skill.level}%')]),
                  ],
                ),
                div(classes: 'skill-tooltip', [
                  p(classes: 'skill-tooltip-desc', [Component.text(skill.description)]),
                  div(classes: 'skill-progress-bar', [
                    div(
                      classes: 'skill-progress-fill',
                      styles: Styles(raw: {'width': '${skill.level}%'}),
                      [],
                    ),
                  ]),
                ]),
              ],
            ),
        ]),
      ],
    );
  }
}