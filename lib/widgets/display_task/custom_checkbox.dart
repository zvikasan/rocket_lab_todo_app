import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';
import '../../models/task.dart';

class CustomCheckbox extends ConsumerWidget {
  const CustomCheckbox({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        task.isCompleted = !task.isCompleted;
        task.save();
      },
      child: Container(
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
