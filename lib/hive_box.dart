import 'package:hive/hive.dart';
import 'package:rocket_lab_todo_app/constants/global_variables.dart';
import 'package:rocket_lab_todo_app/models/task.dart';

class HiveBox {
  static Box<Task> getTasks() => Hive.box<Task>(hiveTaskBoxName);
}
