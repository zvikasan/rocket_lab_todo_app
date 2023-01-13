import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/models/task.dart';
import '../constants/enums.dart';
import 'display_task/display_task_widget.dart';

class TaskListDisplay extends StatelessWidget {
  const TaskListDisplay({
    super.key,
    required this.taskList,
    required this.sortBy,
  });

  final List<Task> taskList;
  final SortBy sortBy;

  @override
  Widget build(BuildContext context) {
    if (sortBy == SortBy.name) {
      taskList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else if (sortBy == SortBy.priority) {
      taskList.sort((a, b) => Task.priorityFromString(b.priority)
          .index
          .compareTo(Task.priorityFromString(a.priority).index));
    } else {
      taskList.sort(
        (a, b) => b.dateAdded.compareTo(a.dateAdded),
      );
    }

    return Column(
      children: [
        for (Task task in taskList)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: DisplayTask(
              task: task,
            ),
          ),
      ],
    );
  }
}
