// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import '../constants/enums.dart';
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
  late DateTime? dateAdded;

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
}
