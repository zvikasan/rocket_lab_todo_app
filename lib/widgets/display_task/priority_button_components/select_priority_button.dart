import 'package:flutter/material.dart';
import '../../../constants/enums.dart';
import '../../../models/task.dart';
import '../../../theme/text_styles.dart';

class SelectPriorityButton extends StatelessWidget {
  const SelectPriorityButton({
    super.key,
    required this.priority,
    required this.task,
  });

  final TaskPriority priority;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
        side: BorderSide(color: Task.priorityColor(priority)),
        elevation: 0,
      ),
      onPressed: () {
        task.priority = Task.priorityToString(priority);
        task.save();
        Navigator.pop(context);
      },
      child: Text(
        priority.caption,
        style: TextStyles.regular.copyWith(color: Task.priorityColor(priority)),
      ),
    );
  }
}
