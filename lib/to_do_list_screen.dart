import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_lab_todo_app/theme/text_styles.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';
import 'package:rocket_lab_todo_app/widgets/add_task_widget.dart';
import 'package:rocket_lab_todo_app/widgets/display_task_widget/custom_checkbox.dart';
import 'package:rocket_lab_todo_app/widgets/display_task_widget/display_task_widget.dart';
import 'package:rocket_lab_todo_app/widgets/display_task_widget/priority_button.dart';
import 'package:rocket_lab_todo_app/widgets/sort_button.dart';

class ToDoListScreen extends ConsumerWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ThemeColors.background,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "To Do:",
                          style: TextStyles.large
                              .copyWith(color: ThemeColors.accent1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Column(children: [
                      DisplayTaskWidget(),
                      const SizedBox(height: 10),
                      DisplayTaskWidget(),
                      const SizedBox(height: 10),
                      DisplayTaskWidget(),
                    ]),
                  ),
                ],
              ),
              Column(
                children: const [
                  Spacer(),
                  AddTaskWidget(),
                  SizedBox(height: 40),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
