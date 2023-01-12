import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/text_styles.dart';
import '../theme/theme_colors.dart';

class AddTaskWidget extends ConsumerWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: ThemeColors.taskBg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
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
        ],
      ),
    );
  }
}
