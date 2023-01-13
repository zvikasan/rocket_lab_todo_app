import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/theme/text_styles.dart';
import 'package:rocket_lab_todo_app/widgets/display_task/priority_button_components/task_priority_bottom_sheet.dart';
import '../../models/task.dart';
import '../../theme/theme_colors.dart';

class PriorityButton extends StatelessWidget {
  const PriorityButton({
    super.key,
    required this.task,
  });
  final Task task;

  _onTap(BuildContext context) async {
    if (task.isCompleted) return;
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: ThemeColors.taskBg,
      isScrollControlled: true,
      builder: (_) {
        return TaskPriorityBottomSheet(task: task);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.background),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          Task.priorityFromString(task.priority).name,
          style: TextStyles.small.copyWith(
            color: Task.priorityColor(Task.priorityFromString(task.priority)),
          ),
        ),
      ),
    );
  }
}
