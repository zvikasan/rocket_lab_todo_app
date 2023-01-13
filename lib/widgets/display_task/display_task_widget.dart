import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_lab_todo_app/widgets/display_task/priority_button.dart';

import '../../models/task.dart';
import '../../theme/text_styles.dart';
import '../../theme/theme_colors.dart';
import 'custom_checkbox.dart';

class DisplayTask extends ConsumerWidget {
  const DisplayTask({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: ThemeColors.taskBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCheckbox(task: task),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              task.name,
              style: TextStyles.small.copyWith(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ),
          PriorityButton(key: UniqueKey(), task: task),
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            onPressed: () {
              task.delete();
            },
            icon: const Icon(
              Icons.delete_rounded,
              size: 30,
              color: ThemeColors.delete,
            ),
            visualDensity: VisualDensity.compact,
          )
        ],
      ),
    );
  }
}
