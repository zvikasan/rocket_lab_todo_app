import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';

class CustomCheckbox extends ConsumerWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: ThemeColors.background,
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.check_rounded,
          color: ThemeColors.accent2,
        ),
      ),
    );
  }
}
