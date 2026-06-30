import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../language/translation_extension.dart';

@client
class QuoteBox extends StatelessComponent {
  const QuoteBox({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'quote-section', [
      div(classes: 'quote-box', [
        p(classes: 'quote-text', [
          Component.text('Coding is 10% writing code and 90% figuring out why it doesn’t work.'.tr(context)),
        ]),
        img(
          src: 'assets/icon/svg/Quote.svg',
          classes: 'quote-svg quote-svg-left',
          alt: 'Quote Start',
        ),
        img(
          src: 'assets/icon/svg/Quote.svg',
          classes: 'quote-svg quote-svg-right',
          alt: 'Quote End',
        ),
      ]),
      div(classes: 'quote-author', [
        Component.text('Mr. Jing'.tr(context)),
      ]),
    ]);
  }
}
