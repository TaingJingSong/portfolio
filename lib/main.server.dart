import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(Document(
    title: 'Taing ChingSong',
    styles: [
      css.import('https://fonts.googleapis.com/css?family=Roboto'),
      css('html, body').styles(
        width: 100.percent,
        minHeight: 100.vh,
        padding: .zero,
        margin: .zero,
        fontFamily: const .list([FontFamily('Roboto'), FontFamilies.sansSerif]),
        backgroundColor: Color('#282C33'), 
      ),
      css('h1').styles(
        margin: .unset,
        fontSize: 4.rem,
      ),
    ],
    head: [
      // Meta Tags
      meta(charset: 'UTF-8'),
      meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0'),
      meta(name: 'description', content: 'My personal portfolio.'),
      meta(name: 'mobile-web-app-capable', content: 'yes'),

      
      // Favicons & Manifest
      link(rel: 'apple-touch-icon', href: 'icons/Icon-192.png'),
      link(rel: 'icon', type: 'image/png', href: 'favicon.ico'),
      link(rel: 'manifest', href: 'manifest.json'),
      
      // External CSS and JS
      // link(rel: 'stylesheet', href: 'global.css'),
      link(rel: 'stylesheet', href: 'styles.css'),
      link(rel: 'stylesheet', href: 'styles/splash_style.css'),
      link(rel: 'stylesheet', href: 'styles/fancy-style.css'),
      link(rel: 'stylesheet', href: 'styles/eslam-style.css'),
      link(rel: 'stylesheet', href: 'styles/star-style.css'),
      link(rel: 'stylesheet', href: 'styles/tool-style.css'),
      link(rel: 'stylesheet', href: 'styles/tools/json-formatter-style.css'),
      link(rel: 'stylesheet', href: 'styles/tools/color-picker-style.css'),
      link(rel: 'stylesheet', href: 'styles/tools/copy-style.css'),
      link(rel: 'stylesheet', href: 'styles/tools/base64-style.css'),
      link(rel: 'stylesheet', href: 'styles/tools/no-page-found-style.css'),
      script(src: 'javascript/splash.js', defer: true),
    ],
    body: Component.fragment([
      script(content: '''
        (function () {
          try {
            if (localStorage.getItem('theme') === 'light') {
              document.body.classList.add('light');
            }
          } catch (e) {}
        })();
      '''),
      // Loading Indicator Elements
      div(id: 'loading_indicator', [
        img(classes: 'indicator', src: '/assets/splash_logo.gif', alt: 'Loading'),
        div(classes: 'progress-track', [
          div(id: 'progress_fill', classes: 'progress-fill', [])
        ]),
        span(classes: 'loading-label', [Component.text('Loading...')])
      ]),

      // Your Actual Application
      ProviderScope(child: const App()),
    ]),
  ));
}
