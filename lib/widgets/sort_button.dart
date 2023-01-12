import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/theme_colors.dart';

class SortButton extends ConsumerWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          print("tapped");
        },
        splashColor: ThemeColors.accent1.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        // radius: 20,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.sort_rounded,
            size: 30,
            color: ThemeColors.hintText,
          ),
        ),
      ),
    );
  }
}
