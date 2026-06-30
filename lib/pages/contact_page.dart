import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/language/translation_extension.dart';
import 'package:portfolio/components/contact_form.dart';

@client
class ContactPage extends StatelessComponent {
  const ContactPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container gap-60', [
      // Banner
      section(classes: 'glass-wrap', [
        h1(classes: 'hero-title', [
          span(classes: 'accent', [Component.text('/')]),
          Component.text('contacts'.tr(context)),
        ]),
        p(classes: 'hero-subtitle', [
          Component.text('contact-whenever'.tr(context)),
        ]),
      ]),

      // Info Section
      section([
        div(classes: 'section-header', [
          h2(classes: 'section-title', [
            span([Component.text('#')]),
            Component.text('contact-info'.tr(context)),
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
                img(src: 'assets/icon/svg/Email.svg', classes: 'contact-item-icon', alt: 'Email'),
                span(classes: 'contact-item-text', [Component.text('chingsong15@gmail.com')]),
              ]),
              a(href: 'https://t.me/jingsongtaing', target: Target.blank, classes: 'contact-item', [
                img(
                  src: 'assets/icon/svg/Telegram.svg',
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
