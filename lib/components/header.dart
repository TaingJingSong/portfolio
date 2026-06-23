import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import '../app.dart';
import '../language/translation_extension.dart';

class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isMenuOpen = false;

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
        _buildNavLink(context, '/', 'home', currentRoute == '/'),
        _buildNavLink(context, '/work', 'works', currentRoute == '/work'),
        _buildNavLink(context, '/about', 'about-me', currentRoute == '/about'),
        _buildNavLink(context, '/contact', 'contacts', currentRoute == '/contact'),
        
        // Language Switcher Dropdown
        select(
          classes: 'lang-switcher',
          onChange: (value) {
            state.onLanguageChanged(value.firstOrNull ?? 'en');
          },
          [
            option(value: 'EN', selected: state.locale == 'en', [Component.text('EN'.tr(context))]),
            option(value: 'KM', selected: state.locale == 'km', [Component.text('KM'.tr(context))]),
          ],
        ),
      ]),
      
      // Mobile Hamburger Toggle
      div(
        classes: 'menu-toggle',
        // onClick: () {
        //   setState(() {
        //     isMenuOpen = !isMenuOpen;
        //   });
        // },
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
          _buildNavLink(context, '/', 'home', currentRoute == '/', isMobile: true),
          _buildNavLink(context, '/work', 'works', currentRoute == '/work', isMobile: true),
          _buildNavLink(context, '/about', 'about-me', currentRoute == '/about', isMobile: true),
          _buildNavLink(context, '/contact', 'contacts', currentRoute == '/contact', isMobile: true),
          
          select(
            classes: 'lang-switcher',
            onChange: (value) {
              state.onLanguageChanged(value.firstOrNull ?? 'en');
              setState(() {
                isMenuOpen = false;
              });
            },
            [
              option(value: 'EN', selected: state.locale == 'en', [Component.text('EN'.tr(context))]),
              option(value: 'KM', selected: state.locale == 'km', [Component.text('KM'.tr(context))]),
            ],
          ),
        ]),
    ]);
  }

  Component _buildNavLink(BuildContext context, String path, String labelKey, bool isActive, {bool isMobile = false}) {
    return Link(
      to: path,
      classes: 'nav-link${isActive ? ' active' : ''}',
      // onClick: isMobile
      //     ? () {
      //         setState(() {
      //           isMenuOpen = false;
      //         });
      //       }
      //     : null,
      child: span([
        span([Component.text('#')]),
        Component.text(labelKey.tr(context)),
      ]),
    );
  }
}
