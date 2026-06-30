import 'package:universal_web/web.dart';

String? getStoredTheme() {
  try {
    return window.localStorage.getItem('theme');
  } catch (_) {
    return null;
  }
}

void storeTheme(String theme) {
  try {
    window.localStorage.setItem('theme', theme);
  } catch (_) {}
}

void addBodyClass(String cls) {
  try {
    window.document.body?.classList.add(cls);
  } catch (_) {}
}

void removeBodyClass(String cls) {
  try {
    window.document.body?.classList.remove(cls);
  } catch (_) {}
}