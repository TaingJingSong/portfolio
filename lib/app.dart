import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:web/web.dart' as html;
import 'dart:js_interop';

import 'components/header.dart';
import 'components/footer.dart';
import 'pages/home_page.dart';
import 'pages/work_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';

@JS('dismissLoader')
external void dismissLoader();

class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String locale = 'en';
  int selectedMenu = 0;

  @override
  void initState() {
    super.initState();
    // Load saved locale or default to 'en'
    final savedLocale = html.window.localStorage.getItem('locale');
    if (savedLocale != null) {
      locale = savedLocale;
    }
    _updateBodyLang();

    // Dismiss loading indicator once components boot up
    try {
      dismissLoader();
    } catch (_) {
      // Fallback if index.html hasn't exposed it
    }
  }

  void _updateBodyLang() {
    final body = html.document.body;
    if (body != null) {
      if (locale == 'km') {
        body.classList.add('km-lang');
      } else {
        body.classList.remove('km-lang');
      }
    }
  }

  @override
  Component build(BuildContext context) {
    return AppState(
      locale: locale,
      selectedMenu: selectedMenu,
      onLanguageChanged: (lang) {
        setState(() {
          locale = lang == 'KM' ? 'km' : 'en';
          html.window.localStorage.setItem('locale', locale);
          _updateBodyLang();
        });
      },
      onMenuChanged: (index) {
        setState(() {
          selectedMenu = index;
        });
      },
      child: div(classes: 'app-root', [
        const Header(),
        Router(
          routes: [
            Route(
              path: '/',
              title: 'Home - Taing ChingSong',
              builder: (context, state) => const HomePage(),
            ),
            Route(
              path: '/work',
              title: 'Works - Taing ChingSong',
              builder: (context, state) => const WorkPage(),
            ),
            Route(
              path: '/about',
              title: 'About - Taing ChingSong',
              builder: (context, state) => const AboutPage(),
            ),
            Route(
              path: '/contact',
              title: 'Contact - Taing ChingSong',
              builder: (context, state) => const ContactPage(),
            ),
          ],
        ),
        const Footer(),
      ]),
    );
  }
}

class AppState extends InheritedComponent {
  final String locale;
  final int selectedMenu;
  final Function(String) onLanguageChanged;
  final Function(int) onMenuChanged;

  const AppState({
    required this.locale,
    required this.selectedMenu,
    required this.onLanguageChanged,
    required this.onMenuChanged,
    required super.child,
    super.key,
  });

  static AppState of(BuildContext context) {
    return context.dependOnInheritedComponentOfExactType<AppState>()!;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return oldWidget.locale != locale || oldWidget.selectedMenu != selectedMenu;
  }
}
