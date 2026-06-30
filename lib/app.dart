import 'package:portfolio/register.dart';

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
        position: .relative(),
        zIndex: ZIndex(1),
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
      child: Component.fragment([
        div(classes: 'star-background', [
          div(id: 'stars', []),
          div(id: 'stars2', []),
          div(id: 'stars3', []),
        ]),
        div(id: 'cursor-glow', []),
        Router(
          routes: [
            ShellRoute(
              builder: (context, state, child) {
                return div(classes: 'main', [
                  const Header(),
                  child,
                  const Footer(),
                ]);
              },
              routes: AppRouter.routes,
            ),
          ],
          errorBuilder: (context, state) {
            return div(classes: 'no-page-found-container', [
              div(classes: 'error-card', [
                h1(classes: 'error-title', [Component.text('404')]),
                p(classes: 'error-subtitle', [Component.text('PAGE NOT FOUND'.tr(context))]),
                p(classes: 'error-text', [
                  Component.text('The coordinates you entered do not exist in the system grid.'.tr(context))
                ]),
                Link(
                  to: '/',
                  classes: 'error-btn',
                  child: Component.text('Return to Base'.tr(context)),
                ),
              ]),
            ]);
          },
        ),
      ]),
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
