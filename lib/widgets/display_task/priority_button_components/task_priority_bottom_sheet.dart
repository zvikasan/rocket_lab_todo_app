import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/widgets/display_task/priority_button_components/select_priority_button.dart';
import '../../../constants/enums.dart';
import '../../../models/task.dart';

class TaskPriorityBottomSheet extends StatelessWidget {
  const TaskPriorityBottomSheet({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          SelectPriorityButton(priority: TaskPriority.high, task: task),
          SelectPriorityButton(priority: TaskPriority.med, task: task),
          SelectPriorityButton(priority: TaskPriority.low, task: task),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
