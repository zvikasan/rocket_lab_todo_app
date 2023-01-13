import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import '../theme/text_styles.dart';
import '../theme/theme_colors.dart';

class SortButton extends ConsumerWidget {
  const SortButton({
    super.key,
    required this.onTap,
  });
  final void Function(SortBy sortBy) onTap;

  PopupMenuItem imageMenuItem(
    BuildContext context,
    SortBy sortBy,
  ) {
    return PopupMenuItem(
      height: 40,
      value: sortBy,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  sortBy.name,
                  style: TextStyles.small,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      offset: const Offset(-10, 10),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: ThemeColors.taskBg, borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.sort_rounded,
          size: 30,
          color: ThemeColors.hintText,
        ),
      ),
      onSelected: (value) => onTap(value),
      itemBuilder: (_) => [
        PopupMenuItem<String>(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort by:',
                style: TextStyles.small,
              ),
              const Divider(
                color: ThemeColors.accent1,
              ),
            ],
          ),
        ),
        imageMenuItem(context, SortBy.name),
        imageMenuItem(context, SortBy.priority),
        imageMenuItem(context, SortBy.dateAdded),
      ],
    );
  }
}
