import 'package:portfolio/register.dart';

import 'package:portfolio/pages/tools/json_formatter_page.dart' deferred as json_formatter;
import 'package:portfolio/pages/tools/color_picker_page.dart' deferred as color_picker;
import 'package:portfolio/pages/tools/base64_page.dart' deferred as base64;

abstract class AppRouter {
  static final routes = <RouteBase>[
    Route(path: AppRoutes.home, title: 'Home - Taing ChingSong', builder: (context, state) => const HomePage()),
    Route(path: AppRoutes.work, title: 'Works - Taing ChingSong', builder: (context, state) => const WorkPage()),
    Route(path: AppRoutes.about, title: 'About - Taing ChingSong', builder: (context, state) => const AboutPage()),
    Route(path: AppRoutes.contact, title: 'Contact - Taing ChingSong', builder: (context, state) => const ContactPage()),
    Route(path: AppRoutes.tool, title: 'Tools - Taing ChingSong', builder: (context, state) => const ToolsPage(), routes: [
      Route.lazy(path: AppRoutes.jsonFormatter, title: 'Json Formatter - Taing ChingSong', builder: (context, state) => json_formatter.JsonFormatterPage(), load: () => json_formatter.loadLibrary()),
      Route.lazy(path: AppRoutes.colorPicker, title: 'Color Picker - Taing ChingSong', builder: (context, state) => color_picker.ColorPickerPage(), load: () => color_picker.loadLibrary()),
      Route.lazy(path: AppRoutes.base64, title: 'Base64 - Taing ChingSong', builder: (context, state) => base64.Base64Page(), load: () => base64.loadLibrary()),
    ]),
  ];
}