import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_lab_todo_app/widgets/display_task_widget/priority_button.dart';

import '../../theme/text_styles.dart';
import '../../theme/theme_colors.dart';
import 'custom_checkbox.dart';

class DisplayTaskWidget extends ConsumerWidget {
  const DisplayTaskWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: ThemeColors.taskBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const CustomCheckbox(),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
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
            ),
          ),
          const PriorityButton(),
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            onPressed: () {},
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
