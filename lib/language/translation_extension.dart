import 'package:jaspr/jaspr.dart';
import 'en.dart';
import 'km.dart';
import '../app.dart';

extension TranslationExtension on String {
  String tr(BuildContext context) {
    final state = AppState.of(context);
    final locale = state.locale;
    final map = locale == 'km' ? km : en;
    return map[this] ?? this;
  }

  String trParams(BuildContext context, Map<String, String> params) {
    String text = tr(context);
    params.forEach((key, value) {
      text = text.replaceAll('{$key}', value);
    });
    return text;
  }
}
