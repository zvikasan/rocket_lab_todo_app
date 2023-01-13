import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';
import '../../models/task.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        task.isCompleted = !task.isCompleted;
        task.save();
      },
      child: Container(
        key: const Key('checkbox'),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: ThemeColors.background,
            borderRadius: BorderRadius.circular(10)),
        child: task.isCompleted
            ? const Icon(
                Icons.check_rounded,
                color: ThemeColors.accent2,
              )
            : const SizedBox(width: 24, height: 25),
      ),
    );
  }
}
