// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../constants/enums.dart';
import '../theme/theme_colors.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String priority;
  @HiveField(2)
  late bool isCompleted;
  @HiveField(3)
  late DateTime dateAdded;

  //In order not to complicate the usage of Hive database, I am storing the task
  //priority property as a string, but in order to keep code clear and avoid potential
  //bugs, I still want to use enum for priority. Hence the two methods below to
  //convert between priority as string to enum and back.
  static TaskPriority priorityFromString(String priority) {
    switch (priority) {
      case 'low':
        return TaskPriority.low;
      case 'medium':
        return TaskPriority.med;
      case 'high':
        return TaskPriority.high;
      default:
        return TaskPriority.med;
    }
  }

  static String priorityToString(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return 'low';
      case TaskPriority.med:
        return 'medium';
      case TaskPriority.high:
        return 'high';
      default:
        return 'medium';
    }
  }

  static Color priorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return ThemeColors.accent2;
      case TaskPriority.med:
        return ThemeColors.accent1;
      case TaskPriority.high:
        return ThemeColors.accent3;
      default:
        return ThemeColors.accent1;
    }
  }
}
