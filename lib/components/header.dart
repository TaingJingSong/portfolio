import 'package:portfolio/app.dart';
import 'package:portfolio/register.dart';

@Import.onWeb('package:portfolio/utils/theme_utils.dart', show: [
  #getStoredTheme,
  #storeTheme,
  #addBodyClass,
  #removeBodyClass,
])
import 'header.imports.dart';

@client
class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    try {
      final saved = getStoredTheme();
      if (saved == 'light') {
        addBodyClass('light');
        Future.microtask(() {
          final state = AppState.of(context);
          state?.onThemeChanged(false);
        });
      }
    } catch (_) {
      dialog([Component.text('Server-side: browser APIs not available, skip')]);
    }
  }

  void toggleTheme(AppState? state) {
    if (state == null) return;
    final goingLight = state.isDark;
    state.onThemeChanged(!goingLight);
    setState(() {});
    if (goingLight) {
      addBodyClass('light');
      storeTheme('light');
    } else {
      removeBodyClass('light');
      storeTheme('dark');
    }
  }

  void toggleMenu() {
    setState(() => isMenuOpen = !isMenuOpen);
  }

  void closeMenu() {
    if (isMenuOpen) setState(() => isMenuOpen = false);
  }

  @override
  Component build(BuildContext context) {
    final state = AppState.of(context);
    final currentRoute = Router.of(context).matchList.fullpath;

    return header(classes: 'app-header container', [
      div(classes: 'logo-section', [
        img(src: '/assets/icon/svg/Profile.svg', classes: 'logo-icon', alt: 'Logo'),
        Component.text('Taing ChingSong'.tr(context)),
      ]),

      // Desktop Nav Menu
      nav(classes: 'nav-menu', [
        _buildNavLink(context, AppRoutes.home, 'home', currentRoute == AppRoutes.home),
        _buildNavLink(context, AppRoutes.work, 'works', currentRoute == AppRoutes.work),
        _buildNavLink(context, AppRoutes.about, 'about-me', currentRoute == AppRoutes.about),
        _buildNavLink(context, AppRoutes.contact, 'contacts', currentRoute == AppRoutes.contact),
        _buildNavLink(context, AppRoutes.tool, 'tool', currentRoute == AppRoutes.tool),

        // Theme Toggle Button
        button(
          classes: 'theme-toggle',
          onClick: () => toggleTheme(state),
          [Component.text(state?.isDark ?? true ? '☀ Light' : '☾ Dark')],
        ),
        
        // Language Switcher Dropdown
        select(
          classes: 'lang-switcher',
          // Standard HTML change event logic
          onChange: (event) {
            final value = event.firstOrNull;
            if (value != null) state?.onLanguageChanged(value);
          },
          [
            option(value: 'en', selected: state?.locale == 'en', [Component.text('EN')]),
            option(value: 'km', selected: state?.locale == 'km', [Component.text('KM')]),
          ],
        ),
      ]),
      
      // Mobile Hamburger Toggle
      button(
        classes: 'menu-toggle',
        onClick: () => toggleMenu(),
        [
          img(
            src: isMenuOpen ? '/assets/icon/svg/Cancel.svg' : '/assets/icon/svg/Menu.svg',
            width: 18,
            alt: 'Menu Toggle',
          ),
        ],
      ),
      
      // Mobile Nav Menu Overlay
      if (isMenuOpen)
        div(classes: 'mobile-nav-menu open', [
          _buildNavLink(context, '/', 'home', currentRoute == '/', onTap: closeMenu),
          _buildNavLink(context, '/work', 'works', currentRoute == '/work', onTap: closeMenu),
          _buildNavLink(context, '/about', 'about-me', currentRoute == '/about', onTap: closeMenu),
          _buildNavLink(context, '/contact', 'contacts', currentRoute == '/contact', onTap: closeMenu),
        ]),
    ]);
  }

  Component _buildNavLink(BuildContext context, String path, String labelKey, bool isActive, {VoidCallback? onTap}) {
    return Link(
      to: path,
      classes: 'nav-link${isActive ? '.active' : ''}',
      // onClick is the standard event listener for elements in Jaspr
      // onClick: (_) => onTap?.call(),
      child: span([
        span([Component.text('#')]),
        Component.text(labelKey.tr(context)),
      ]),
    );
  }
}