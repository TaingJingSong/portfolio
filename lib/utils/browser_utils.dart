import 'dart:js_interop';

@JS('Blob')
extension type JSBlob._(JSObject _) implements JSObject {
  external factory JSBlob(JSArray blobParts, [BlobOptions options]);
}

@JS()
@anonymous
extension type BlobOptions._(JSObject _) implements JSObject {
  external factory BlobOptions({JSString type});
}

@JS('URL.createObjectURL')
external JSString _createObjectURL(JSBlob blob);

@JS('URL.revokeObjectURL')
external void _revokeObjectURL(JSString url);

@JS('document.createElement')
external JSAnchorElement _createElement(JSString tagName);

@JS()
extension type JSAnchorElement._(JSObject _) implements JSObject {
  external set href(JSString value);
  external set download(JSString value);
  external void click();
}

@JS('navigator.clipboard.writeText')
external JSPromise _writeText(JSString text);

/// Triggers a native browser file download
void downloadFile({
  required String content,
  required String filename,
  String mimeType = 'application/json',
}) {
  if (content.isEmpty) return;

  final options = BlobOptions(type: mimeType.toJS);
  final blob = JSBlob([content.toJS].toJS, options);
  final url = _createObjectURL(blob);
  
  final anchor = _createElement('a'.toJS);
  anchor.href = url;
  anchor.download = filename.toJS;
  anchor.click();
  
  _revokeObjectURL(url);
}

/// Copies text to the user's clipboard
void copyToClipboard(String text) {
  if (text.isNotEmpty) {
    _writeText(text.toJS);
  }
}

/// Exposes the raw Object URL creation if needed elsewhere
String createObjectURL(JSBlob blob) => _createObjectURL(blob).toDart;