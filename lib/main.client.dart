library;

import 'package:jaspr/client.dart';
import 'package:portfolio/main.client.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultClientOptions,
  );
  runApp(
    const ClientApp(),
  );
}
