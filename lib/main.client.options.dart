// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:jaspr_content/components/_internal/tab_bar.dart'
    deferred as _tab_bar;
import 'package:portfolio/components/footer.dart' deferred as _footer;
import 'package:portfolio/components/header.dart' deferred as _header;
import 'package:portfolio/components/project_card.dart'
    deferred as _project_card;
import 'package:portfolio/components/quote_box.dart' deferred as _quote_box;
import 'package:portfolio/components/skill_card.dart' deferred as _skill_card;
import 'package:portfolio/model/project_model.dart' as _project_model;
import 'package:portfolio/pages/tools/base64_page.dart'
    deferred as _base64_page;
import 'package:portfolio/pages/tools/color_picker_page.dart'
    deferred as _color_picker_page;
import 'package:portfolio/pages/tools/json_formatter_page.dart'
    deferred as _json_formatter_page;
import 'package:portfolio/pages/about_page.dart' deferred as _about_page;
import 'package:portfolio/pages/contact_page.dart' deferred as _contact_page;
import 'package:portfolio/pages/home_page.dart' deferred as _home_page;
import 'package:portfolio/pages/tool_page.dart' deferred as _tool_page;
import 'package:portfolio/pages/work_page.dart' deferred as _work_page;
import 'package:portfolio/app.dart' deferred as _app;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'jaspr_content:tab_bar': ClientLoader(
      (p) => _tab_bar.TabBar(
        initialValue: p['initialValue'] as String,
        items: (p['items'] as Map<String, Object?>).cast<String, String>(),
      ),
      loader: _tab_bar.loadLibrary,
    ),
    'app': ClientLoader((p) => _app.App(), loader: _app.loadLibrary),
    'footer': ClientLoader(
      (p) => _footer.Footer(),
      loader: _footer.loadLibrary,
    ),
    'header': ClientLoader(
      (p) => _header.Header(),
      loader: _header.loadLibrary,
    ),
    'project_card': ClientLoader(
      (p) => _project_card.ProjectCard(
        project: _project_model.ProjectModel.decode(
          p['project'] as Map<String, dynamic>,
        ),
      ),
      loader: _project_card.loadLibrary,
    ),
    'quote_box': ClientLoader(
      (p) => _quote_box.QuoteBox(),
      loader: _quote_box.loadLibrary,
    ),
    'skill_card': ClientLoader(
      (p) => _skill_card.SkillCard(
        title: p['title'] as String,
        skills: (p['skills'] as List<Object?>).cast<String>(),
      ),
      loader: _skill_card.loadLibrary,
    ),
    'about_page': ClientLoader(
      (p) => _about_page.AboutPage(),
      loader: _about_page.loadLibrary,
    ),
    'contact_page': ClientLoader(
      (p) => _contact_page.ContactPage(),
      loader: _contact_page.loadLibrary,
    ),
    'home_page': ClientLoader(
      (p) => _home_page.HomePage(),
      loader: _home_page.loadLibrary,
    ),
    'tool_page': ClientLoader(
      (p) => _tool_page.ToolsPage(),
      loader: _tool_page.loadLibrary,
    ),
    'base64_page': ClientLoader(
      (p) => _base64_page.Base64Page(),
      loader: _base64_page.loadLibrary,
    ),
    'color_picker_page': ClientLoader(
      (p) => _color_picker_page.ColorPickerPage(),
      loader: _color_picker_page.loadLibrary,
    ),
    'json_formatter_page': ClientLoader(
      (p) => _json_formatter_page.JsonFormatterPage(),
      loader: _json_formatter_page.loadLibrary,
    ),
    'work_page': ClientLoader(
      (p) => _work_page.WorkPage(),
      loader: _work_page.loadLibrary,
    ),
  },
);
