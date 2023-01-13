import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/theme/text_styles.dart';
import '../../constants/enums.dart';
import '../../models/task.dart';
import '../../theme/theme_colors.dart';

class PriorityButton extends StatelessWidget {
  const PriorityButton({
    super.key,
    required this.task,
  });
  final Task task;

  DropdownMenuItem<TaskPriority> buildMenuItem(TaskPriority item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item.name,
          style: TextStyles.small.copyWith(
            color: priorityColor(item),
          ),
        ),
      );

  Color priorityColor(TaskPriority priority) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.background),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TaskPriority>(
          value: Task.priorityFromString(task.priority),
          isDense: true,
          iconSize: 0.0,
          icon: const SizedBox.shrink(),
          alignment: Alignment.bottomRight,
          borderRadius: BorderRadius.circular(10),
          style: TextStyles.small.copyWith(
            color: priorityColor(
              Task.priorityFromString(task.priority),
            ),
          ),
          items: TaskPriority.values.map((value) {
            return buildMenuItem(value);
          }).toList(),
          onChanged: (value) {
            task.priority = Task.priorityToString(value!);
            task.save();
          },
        ),
      ),
    );
  }
}
