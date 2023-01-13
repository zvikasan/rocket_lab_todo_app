import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/screens/to_do_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Lab Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const ToDoListScreen(),
    );
  }
}
