import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';
import '../language/translation_extension.dart';
import '../data/project.dart';
import '../data/skill.dart';
import '../components/quote_box.dart';
import '../components/project_card.dart';
import '../components/skill_card.dart';
import '../components/contact_form.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container gap-60', [
      // 1. Hero Section
      section(classes: 'glass-wrap hero-flex', [
        div(classes: 'hero-left', [
          h1(classes: 'hero-title', [
            Component.text('ChingSong is a '.tr(context)),
            span(classes: 'accent', [Component.text('front-end'.tr(context))]),
            Component.text(' and '),
            span(classes: 'accent', [Component.text('cross-platform developer.'.tr(context))]),
          ]),
          p(classes: 'hero-subtitle', [
            Component.text(
              'I craft seamless experiences across devices, blending design and logic to bring ideas to life—one pixel and line of code at a time.'
                  .tr(context),
            ),
          ]),
          Link(
            to: '/contact',
            classes: 'btn-primary',
            child: Component.text('Contact me!!'.tr(context)),
          ),
        ]),
        div(classes: 'hero-right', [
          div(classes: 'profile-container', [
            img(
              src: '/assets/icon/svg/Logo.svg',
              classes: 'logo-bg',
              alt: 'Logo Background',
            ),
            img(
              src: '/assets/image/Profile.png',
              classes: 'profile-img',
              alt: 'ChingSong Profile',
            ),
          ]),
          div(classes: 'status-banner glass-wrap', [
            div(classes: 'pulse-dot', []),
            p([
              Component.text('Currently working at '.tr(context)),
              a(
                href: 'https://www.facebook.com/p/InnoTech-Solution-61561416010591/',
                target: Target.blank,
                classes: 'status-link',
                [Component.text('Innotech Solution'.tr(context))],
              ),
            ]),
          ]),
        ]),
      ]),

      // 2. Quote Widget
      const QuoteBox(),

      // 3. Projects Section
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('projects'.tr(context)),
          ]),
          div(classes: 'section-line', []),
          Link(
            to: '/work',
            classes: 'view-all-link',
            child: Component.text('View all ~~>'.tr(context)),
          ),
        ]),
        div(classes: 'project-grid', [
          // Take first 4 projects for homepage preview
          for (final project in projects.take(4))
            ProjectCard(project: project),
        ]),
      ]),

      // 4. Skills Section
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('skills'.tr(context)),
          ]),
          div(classes: 'section-line', []),
        ]),
        div(classes: 'skills-flex', [
          // Left Side: Decorative layout
          div(classes: 'skills-left', [
            div(
              classes: 'box-line',
              styles: Styles(width: 50.px, height: 50.px),
              [],
            ),
            div(
              classes: 'dot-box',
              styles: Styles(
                width: 50.px,
                height: 50.px,
                margin: Margin.only(top: 40.px, left: 30.px),
              ),
              [for (var i = 0; i < 25; i++) span([])],
            ),
            img(
              src: '/assets/icon/svg/Logo.svg',
              styles: Styles(
                width: 80.px,
                margin: Margin.only(top: 100.px, left: 80.px),
              ),
              alt: 'Skill Logo Decor',
            ),
          ]),
          // Right Side: Skills Cards
          div(classes: 'skills-right', [
            SkillCard(title: 'Language'.tr(context), skills: language),
            SkillCard(title: 'Database'.tr(context), skills: database),
            SkillCard(title: 'Tool'.tr(context), skills: tool),
            SkillCard(title: 'State Management'.tr(context), skills: statemanagement),
          ]),
        ]),
      ]),

      // 5. About Me Section
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
            Link(
              to: '/about',
              classes: 'btn-primary',
              child: Component.text('Read more ~~>'.tr(context)),
            ),
          ]),
          div(classes: 'about-image-column', [
            div(classes: 'about-img-container', [
              img(
                src: '/assets/image/Profile.png',
                classes: 'about-img',
                alt: 'About ChingSong',
              ),
            ]),
          ]),
        ]),
      ]),

      // 6. Contact Section
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('contact'.tr(context)),
          ]),
          div(classes: 'section-line', []),
        ]),
        div(classes: 'contact-flex', [
          div(classes: 'contact-left', [
            p(classes: 'about-text', [
              Component.text(
                'Hi, I\'m a Flutter mobile developer passionate about building clean and user-friendly apps. If you\'re looking for someone to bring your ideas to life with Flutter, feel free to reach out — I\'d love to connect!'
                    .tr(context),
              ),
            ]),
            div(classes: 'contact-box', [
              h4(classes: 'contact-box-title', [Component.text('Message me here'.tr(context))]),
              a(href: 'mailto:chingsong15@gmail.com', classes: 'contact-item', [
                img(src: '/assets/icon/svg/Email.svg', classes: 'contact-item-icon', alt: 'Email'),
                span(classes: 'contact-item-text', [Component.text('chingsong15@gmail.com')]),
              ]),
              a(href: 'https://t.me/jingsongtaing', target: Target.blank, classes: 'contact-item', [
                img(
                  src: '/assets/icon/svg/Telegram.svg',
                  classes: 'contact-item-icon',
                  alt: 'Telegram',
                ),
                span(classes: 'contact-item-text', [Component.text('chingsong15@gmail.com')]),
              ]),
            ]),
          ]),
          div(classes: 'contact-right', [
            const ContactForm(),
          ]),
        ]),
      ]),
    ]);
  }
}
