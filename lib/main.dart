import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const ProviderScope(child: MyApp()));
  }, (Object error, StackTrace stack) {
    debugPrint("Uncaught exception: ${error.toString()}");
  });
}
