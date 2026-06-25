library;

import 'package:jaspr/client.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/main.client.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultClientOptions,
  );
  runApp(
    ProviderScope(child: const App()),
  );
}
