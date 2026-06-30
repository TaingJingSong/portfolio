import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/language/translation_extension.dart';
import 'package:portfolio/data/skill.dart';
import 'package:portfolio/data/fun_fact.dart';
import 'package:portfolio/components/skill_card.dart';

@client
class AboutPage extends StatelessComponent {
  const AboutPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container gap-60', [
      // Banner
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [Component.text('/')]),
          Component.text('about-me'.tr(context)),
        ]),
        p(classes: 'hero-subtitle', [
          Component.text('who-am-i'.tr(context)),
        ]),
      ]),

      // Info Section
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('about-me'.tr(context)),
          ]),
          div(classes: 'section-line', []),
        ]),
        div(classes: 'glass-wrap about-flex', [
          div(classes: 'about-text-column', [
            h3(classes: 'hero-title', [
              Component.text('Hello, I\'m ChingSong'.tr(context)),
            ]),
            p(classes: 'about-text', [
              Component.text(
                'I\'m a Flutter mobile developer with a strong passion for building modern, user-friendly apps. I have experience creating real-world projects using Flutter, Dart, GetX, and Figma, and I enjoy turning ideas into clean, functional mobile applications.'
                    .tr(context),
              ),
            ]),
            p(classes: 'about-text', [
              Component.text(
                'My focus is on writing maintainable, scalable code and delivering responsive apps that provide smooth user experiences across both Android and iOS platforms. Whether it\'s building from scratch or improving existing apps, I thrive in transforming complex problems into intuitive interfaces.'
                    .tr(context),
              ),
            ]),
          ]),
          div(classes: 'about-image-column', [
            div(classes: 'about-img-container', [
              img(
                src: 'assets/image/Profile.png',
                classes: 'about-img',
                alt: 'ChingSong Profile',
              ),
            ]),
          ]),
        ]),
      ]),

      // Skills Section
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('skills'.tr(context)),
          ]),
          div(classes: 'section-line', []),
        ]),
        div(classes: 'skills-right', [
          SkillCard(title: 'Language'.tr(context), skills: language),
          SkillCard(title: 'Database'.tr(context), skills: database),
          SkillCard(title: 'Tool'.tr(context), skills: tool),
          SkillCard(title: 'State Management'.tr(context), skills: statemanagement),
        ]),
      ]),

      // Fun Facts Section
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('my-fun-facts'.tr(context)),
          ]),
          div(classes: 'section-line', []),
        ]),
        div(classes: 'fun-facts-wrap', [
          for (final fact in funFacts)
            div(classes: 'fun-fact-box', [
              Component.text(fact.tr(context)),
            ]),
        ]),
      ]),
    ]);
  }
}
