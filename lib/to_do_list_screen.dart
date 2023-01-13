import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rocket_lab_todo_app/hive_box.dart';
import 'package:rocket_lab_todo_app/theme/text_styles.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';
import 'package:rocket_lab_todo_app/widgets/add_task_widget.dart';
import 'package:rocket_lab_todo_app/widgets/display_task_widget/display_task_widget.dart';

import 'models/task.dart';

class ToDoListScreen extends ConsumerStatefulWidget {
  const ToDoListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends ConsumerState<ToDoListScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    child: ValueListenableBuilder<Box<Task>>(
                        valueListenable: HiveBox.getTasks().listenable(),
                        builder: (context, box, _) {
                          final activeTasks = box.values
                              .where((task) => !task.isCompleted)
                              .toList()
                              .cast<Task>();
                          final completedTasks = box.values
                              .where((task) => task.isCompleted)
                              .toList()
                              .cast<Task>();
                          return ListView(
                            children: [
                              for (Task task in activeTasks)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: DisplayTaskWidget(task: task),
                                ),
                              Row(
                                children: [
                                  Text(
                                    "Completed:",
                                    style: TextStyles.large
                                        .copyWith(color: ThemeColors.accent1),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              for (Task task in completedTasks)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: DisplayTaskWidget(task: task),
                                ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(height: 120),
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
