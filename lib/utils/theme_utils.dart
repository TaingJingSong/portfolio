import 'dart:js_interop';

@JS('localStorage.getItem')
external JSString? _getItem(JSString key);

@JS('localStorage.setItem')
external void _setItem(JSString key, JSString value);

@JS('document.body.classList.add')
external void _classAdd(JSString cls);

@JS('document.body.classList.remove')
external void _classRemove(JSString cls);

String? getStoredTheme() => _getItem('theme'.toJS)?.toDart;

void storeTheme(String theme) => _setItem('theme'.toJS, theme.toJS);

void addBodyClass(String cls) => _classAdd(cls.toJS);

void removeBodyClass(String cls) => _classRemove(cls.toJS);