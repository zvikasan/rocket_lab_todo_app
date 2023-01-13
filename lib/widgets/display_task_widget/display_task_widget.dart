import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_lab_todo_app/widgets/display_task_widget/priority_button.dart';

import '../../models/task.dart';
import '../../theme/text_styles.dart';
import '../../theme/theme_colors.dart';
import 'custom_checkbox.dart';

class DisplayTaskWidget extends ConsumerWidget {
  const DisplayTaskWidget({
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
            child: TextFormField(
              initialValue: task.name,
              maxLines: 3,
              minLines: 1,
              style: TextStyles.small.copyWith(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add task",
                hintStyle: TextStyles.small.copyWith(
                  color: ThemeColors.hintText,
                ),
              ),
              onChanged: (value) {
                task.name = value;
                task.save();
              },
            ),
          ),
          PriorityButton(task: task),
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
