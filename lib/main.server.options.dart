// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:jaspr_content/components/_internal/tab_bar.dart' as _tab_bar;
import 'package:jaspr_content/components/tabs.dart' as _tabs;
import 'package:portfolio/components/footer.dart' as _footer;
import 'package:portfolio/components/header.dart' as _header;
import 'package:portfolio/components/project_card.dart' as _project_card;
import 'package:portfolio/components/quote_box.dart' as _quote_box;
import 'package:portfolio/components/skill_card.dart' as _skill_card;
import 'package:portfolio/pages/tools/color_picker_page.dart'
    as _color_picker_page;
import 'package:portfolio/pages/tools/json_formatter_page.dart'
    as _json_formatter_page;
import 'package:portfolio/pages/about_page.dart' as _about_page;
import 'package:portfolio/pages/contact_page.dart' as _contact_page;
import 'package:portfolio/pages/home_page.dart' as _home_page;
import 'package:portfolio/pages/tool_page.dart' as _tool_page;
import 'package:portfolio/pages/work_page.dart' as _work_page;
import 'package:portfolio/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _tab_bar.TabBar: ClientTarget<_tab_bar.TabBar>(
      'jaspr_content:tab_bar',
      params: __tab_barTabBar,
    ),
    _app.App: ClientTarget<_app.App>('app'),
    _footer.Footer: ClientTarget<_footer.Footer>('footer'),
    _header.Header: ClientTarget<_header.Header>('header'),
    _project_card.ProjectCard: ClientTarget<_project_card.ProjectCard>(
      'project_card',
      params: __project_cardProjectCard,
    ),
    _quote_box.QuoteBox: ClientTarget<_quote_box.QuoteBox>('quote_box'),
    _skill_card.SkillCard: ClientTarget<_skill_card.SkillCard>(
      'skill_card',
      params: __skill_cardSkillCard,
    ),
    _about_page.AboutPage: ClientTarget<_about_page.AboutPage>('about_page'),
    _contact_page.ContactPage: ClientTarget<_contact_page.ContactPage>(
      'contact_page',
    ),
    _home_page.HomePage: ClientTarget<_home_page.HomePage>('home_page'),
    _tool_page.ToolsPage: ClientTarget<_tool_page.ToolsPage>('tool_page'),
    _color_picker_page.ColorPickerPage:
        ClientTarget<_color_picker_page.ColorPickerPage>('color_picker_page'),
    _json_formatter_page.JsonFormatterPage:
        ClientTarget<_json_formatter_page.JsonFormatterPage>(
          'json_formatter_page',
        ),
    _work_page.WorkPage: ClientTarget<_work_page.WorkPage>('work_page'),
  },
  styles: () => [
    ..._tabs.Tabs.styles,
    ..._tab_bar.TabBar.styles,
    ..._app.App.styles,
  ],
);

Map<String, Object?> __tab_barTabBar(_tab_bar.TabBar c) => {
  'initialValue': c.initialValue,
  'items': c.items,
};
Map<String, Object?> __project_cardProjectCard(_project_card.ProjectCard c) => {
  'project': c.project.encode(),
};
Map<String, Object?> __skill_cardSkillCard(_skill_card.SkillCard c) => {
  'title': c.title,
  'skills': c.skills,
};
