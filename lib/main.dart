import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/constants/global_variables.dart';
import 'package:rocket_lab_todo_app/models/task.dart';
import 'app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    await Hive.openBox<Task>(hiveTaskBoxName);
    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    debugPrint("Uncaught exception: ${error.toString()}");
  });
}
