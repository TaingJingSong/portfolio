import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'package:portfolio/components/header.dart';
import 'package:portfolio/components/footer.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/work_page.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/contact_page.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppWidgetState();

  @css
  static List<StyleRule> get styles => [
    css('.main', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
      ),
    ]),
  ];
}

class _AppWidgetState extends State<App> {
  String locale = 'en';
  int selectedMenu = 0;
  bool isDark = true;

  @override
  Component build(BuildContext context) {
    return AppState(
      locale: locale,
      selectedMenu: selectedMenu,
      isDark: isDark,
      onLanguageChanged: (lang) => setState(() => locale = lang),
      onMenuChanged: (index) => setState(() => selectedMenu = index),
      onThemeChanged: (dark) => setState(() => isDark = dark),
      child: Router(
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              return div(classes: 'main', [
                const Header(),
                child,
                const Footer(),
              ]);
            },
            routes: [
              Route(path: '/', title: 'Home - Taing ChingSong', builder: (context, state) => const HomePage()),
              Route(path: '/work', title: 'Works - Taing ChingSong', builder: (context, state) => const WorkPage()),
              Route(path: '/about', title: 'About - Taing ChingSong', builder: (context, state) => const AboutPage()),
              Route(path: '/contact', title: 'Contact - Taing ChingSong', builder: (context, state) => const ContactPage()),
            ],
          ),
        ],
      ),
    );
  }
}

class AppState extends InheritedComponent {
  final String locale;
  final int selectedMenu;
  final bool isDark;
  final void Function(String) onLanguageChanged;
  final void Function(int) onMenuChanged;
  final void Function(bool) onThemeChanged;

  const AppState({
    required this.locale,
    required this.selectedMenu,
    required this.isDark,
    required this.onLanguageChanged,
    required this.onMenuChanged,
    required this.onThemeChanged,
    required super.child,
    super.key,
  });

  static AppState? of(BuildContext context) {
    return context.dependOnInheritedComponentOfExactType<AppState>();
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return oldWidget.locale != locale ||
        oldWidget.selectedMenu != selectedMenu ||
        oldWidget.isDark != isDark;
  }
}