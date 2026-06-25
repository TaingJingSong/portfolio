import 'package:portfolio/register.dart';

class AppText extends StatelessComponent {
  const AppText({super.key, this.text = ''});
  final String text;

  @override
  Component build(BuildContext context) {
    return Component.text(text);
  }
}

class AppTextTitle extends AppText {
  const AppTextTitle({super.key});
}