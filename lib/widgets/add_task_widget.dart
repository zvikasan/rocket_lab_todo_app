import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/hive_box.dart';

import '../models/task.dart';
import '../theme/text_styles.dart';
import '../theme/theme_colors.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        // border: Border.all(color: ThemeColors.accent1),
        color: ThemeColors.taskBg,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            // offset: Offset(0, 1),
            blurRadius: 30,

            color: ThemeColors.accent1.withOpacity(0.7),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              style:
                  TextStyles.regular.copyWith(decoration: TextDecoration.none),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add task",
                hintStyle: TextStyles.small.copyWith(
                  color: ThemeColors.hintText,
                ),
              ),
              onFieldSubmitted: (value) {
                final task = Task()
                  ..name = value
                  ..priority = Task.priorityToString(TaskPriority.med)
                  ..isCompleted = false;
                final hiveBox = HiveBox.getTasks();
                hiveBox.add(task);
                _controller.text = "";
              },
            ),
          ),
        ],
      ),
    );
  }
}
