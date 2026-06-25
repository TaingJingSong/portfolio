extension StringExt on String {
  String get slashStyle => toLowerCase().replaceAll(' ', '-');
}