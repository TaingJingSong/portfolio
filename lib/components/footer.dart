import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import '../language/translation_extension.dart';

@client
class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    final currentYear = DateTime.now().year.toString();

    return footer(classes: 'app-footer container', [
      div(classes: 'footer-flex', [
        div(classes: 'footer-left', [
          div(classes: 'footer-email-row', [
            img(src: '/assets/icon/svg/Profile.svg', width: 15, alt: 'Email icon'),
            Component.text('chingsong15@gmail.com'),
          ]),
          p(classes: 'footer-desc', [
            Component.text('Front-end and cross-platform developer.'.tr(context)),
          ]),
        ]),
        div(classes: 'footer-right', [
          h4(classes: 'footer-right-title', [Component.text('Media'.tr(context))]),
          div(classes: 'footer-social-row', [
            a(href: 'https://github.com/JingSongJai', target: Target.blank, [
              img(src: '/assets/icon/svg/Github.svg', classes: 'footer-social-icon', alt: 'Github')
            ]),
            a(href: 'https://www.linkedin.com/in/jing-song-a0732334b/', target: Target.blank, [
              img(src: '/assets/icon/svg/Linkedin.svg', classes: 'footer-social-icon', alt: 'LinkedIn')
            ]),
            a(href: 'https://t.me/jingsongtaing', target: Target.blank, [
              img(src: '/assets/icon/svg/Telegram.svg', classes: 'footer-social-icon', alt: 'Telegram')
            ]),
          ]),
        ]),
      ]),
      p(classes: 'footer-copyright', [
        Component.text('© Copyright {year}. Made by ChingSong'.trParams(context, {'year': currentYear})),
      ]),
    ]);
  }
}
