import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_lab_todo_app/theme/text_styles.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';

class PriorityButton extends ConsumerWidget {
  const PriorityButton({super.key});

  final items = const ['Low', 'Medium', 'High'];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
          // border: Border.all(color: ThemeColors.background),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          iconSize: 30,
          icon: const Icon(Icons.arrow_drop_down_rounded),
          alignment: Alignment.bottomRight,
          borderRadius: BorderRadius.circular(10),
          value: "High",
          style: TextStyles.small, //Todo change color depending on priority
          items: items.map(buildMenuItem).toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
