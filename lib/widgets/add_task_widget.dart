import 'package:flutter/material.dart';
import 'package:rocket_lab_todo_app/hive_box.dart';

import '../constants/enums.dart';
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
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: ThemeColors.taskBg,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            color: ThemeColors.accent1.withOpacity(1),
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
                if (value.trim().isEmpty) return;
                final task = Task()
                  ..name = value.trim()
                  ..priority = Task.priorityToString(TaskPriority.med)
                  ..isCompleted = false
                  ..dateAdded = DateTime.now();
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
