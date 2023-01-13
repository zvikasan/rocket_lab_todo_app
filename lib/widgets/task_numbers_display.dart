import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class TaskNumbersDisplay extends StatelessWidget {
  const TaskNumbersDisplay({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
  });

  final int totalTasks;
  final int completedTasks;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(totalTasks.toString(), style: TextStyles.regular),
            Text(
              "Total",
              style: TextStyles.small,
            ),
          ],
        ),
        Column(
          children: [
            Text(completedTasks.toString(), style: TextStyles.regular),
            Text(
              "Completed",
              style: TextStyles.small,
            ),
          ],
        ),
      ],
    );
  }
}
