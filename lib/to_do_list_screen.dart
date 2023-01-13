import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rocket_lab_todo_app/hive_box.dart';
import 'package:rocket_lab_todo_app/theme/text_styles.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';
import 'package:rocket_lab_todo_app/widgets/add_task_widget.dart';
import 'package:rocket_lab_todo_app/widgets/sort_button.dart';
import 'package:rocket_lab_todo_app/widgets/task_list_display.dart';
import 'constants/enums.dart';
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

  List<Task> _activeTasks = [];
  List<Task> _completedTasks = [];

  SortBy _sortBy = SortBy.dateAdded;
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ThemeColors.background,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Column(
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
                      ),
                      SortButton(
                        onTap: (value) => setState(() => _sortBy = value),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ValueListenableBuilder<Box<Task>>(
                        valueListenable: HiveBox.getTasks().listenable(),
                        builder: (context, box, _) {
                          _activeTasks = box.values
                              .where((task) => !task.isCompleted)
                              .toList()
                              .cast<Task>();
                          _completedTasks = box.values
                              .where((task) => task.isCompleted)
                              .toList()
                              .cast<Task>();
                          return RawScrollbar(
                            crossAxisMargin: -15,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TaskListDisplay(
                                    key: UniqueKey(),
                                    sortBy: _sortBy,
                                    taskList: _activeTasks,
                                  ),
                                  _completedTasks.isNotEmpty
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Completed:",
                                                style: TextStyles.large
                                                    .copyWith(
                                                        color: ThemeColors
                                                            .accent1),
                                              )
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  TaskListDisplay(
                                    key: UniqueKey(),
                                    sortBy: _sortBy,
                                    taskList: _completedTasks,
                                  ),
                                ],
                              ),
                            ),
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
