import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_lab_todo_app/constants/enums.dart';
import 'package:rocket_lab_todo_app/models/task.dart';
import 'package:rocket_lab_todo_app/theme/text_styles.dart';
import 'package:rocket_lab_todo_app/theme/theme_colors.dart';
import 'package:rocket_lab_todo_app/widgets/add_task_widget.dart';
import 'package:rocket_lab_todo_app/widgets/display_task/display_task_widget.dart';
import 'package:rocket_lab_todo_app/widgets/sort_button.dart';
import 'package:rocket_lab_todo_app/widgets/task_list_display.dart';
import 'package:rocket_lab_todo_app/widgets/task_numbers_display.dart';

void main() {
  Task firstTaskActive = Task()
    ..name = "Buy milk"
    ..dateAdded = DateTime(2023, 1, 1)
    ..isCompleted = false
    ..priority = Task.priorityToString(TaskPriority.high);
  Task firstTaskComplete = Task()
    ..name = "Buy milk"
    ..dateAdded = DateTime.now()
    ..isCompleted = true
    ..priority = Task.priorityToString(TaskPriority.med);

  Task secondTaskActive = Task()
    ..name = "Buy cookies"
    ..dateAdded = DateTime(2023, 1, 2)
    ..isCompleted = false
    ..priority = Task.priorityToString(TaskPriority.med);

  Task thirdTaskActive = Task()
    ..name = "Submit challenge"
    ..dateAdded = DateTime(2023, 1, 3)
    ..isCompleted = false
    ..priority = Task.priorityToString(TaskPriority.med);

  Task fourthTaskActive = Task()
    ..name = "Get the job"
    ..dateAdded = DateTime(2023, 1, 4)
    ..isCompleted = false
    ..priority = Task.priorityToString(TaskPriority.low);

  testWidgets('Test DisplayTaskWidget', (WidgetTester tester) async {
    //Testing active task
    //Creating task to test the widget with
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: DisplayTaskWidget(task: firstTaskActive)),
    ));
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text('high'), findsOneWidget);
    expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
    final containerFinder = find.byKey(const Key('checkbox'));
    expect(containerFinder, findsOneWidget);

    //Testing complete task
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: DisplayTaskWidget(task: firstTaskComplete)),
    ));
    final taskTextFinder = find.text('Buy milk');
    expect(taskTextFinder, findsOneWidget);
    final decoratedText = taskTextFinder.evaluate().first.widget as Text;
    expect(decoratedText.style!.decoration, TextDecoration.lineThrough);
    expect(find.text('med'), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
  });

  testWidgets('Test TaskNumbersDisplay widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
          body: TaskNumbersDisplay(
        totalTasks: 10,
        completedTasks: 4,
      )),
    ));
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
  });

  testWidgets('Test SortButton', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: SortButton(
        onTap: (_) {},
      )),
    ));
    final buttonIcon = find.byIcon(Icons.sort_rounded);
    expect(buttonIcon, findsOneWidget);
    await tester.tap(buttonIcon);
    await tester.pumpAndSettle();
    expect(find.text('Sort by:'), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);
    expect(find.text('name'), findsOneWidget);
    expect(find.text('priority'), findsOneWidget);
    expect(find.text('dateAdded'), findsOneWidget);
  });

  testWidgets('Test AddTaskWidget', (WidgetTester tester) async {
    BoxDecoration decoration = BoxDecoration(
      color: ThemeColors.taskBg,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          blurRadius: 30,
          color: ThemeColors.accent1.withOpacity(1),
        ),
      ],
    );
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: AddTaskWidget()),
    ));
    expect(find.text('Add task'), findsOneWidget);
    //Since the AddTaskWidget has beautiful diffused shadow we want to make
    //sure that it exists
    expect(
        find.byWidgetPredicate(
            (widget) => widget is Container && widget.decoration == decoration),
        findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextFormField),
        findsOneWidget);
  });

  testWidgets('Test TaskListDisplay widget', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    List<Task> taskList = [
      firstTaskActive,
      secondTaskActive,
      thirdTaskActive,
      fourthTaskActive
    ];
    TextStyle style =
        TextStyles.small.copyWith(decoration: TextDecoration.none);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskListDisplay(
          taskList: taskList,
          sortBy: SortBy.dateAdded,
        ),
      ),
    ));
    //Making sure that all 4 tasks from the list are displayed by the widget
    //And after that making sure that the tasks are displayed in the correct order
    //according to the chosen SortBy order

    //In this case the tasks should be sorted by date, the most recent dated
    //task should be on top of the displayed list
    final tasksCaptions = find
        .byWidgetPredicate((widget) => widget is Text && widget.style == style);
    expect(tasksCaptions, findsNWidgets(4));
    var textWidgets = tester.widgetList(tasksCaptions);
    var firstTextWidget = textWidgets.first;
    var secondTextWidget = textWidgets.elementAt(1);
    var thirdTextWidget = textWidgets.elementAt(2);
    var fourthTextWidget = textWidgets.last;
    expect((firstTextWidget as Text).data, 'Get the job');
    expect((secondTextWidget as Text).data, 'Submit challenge');
    expect((thirdTextWidget as Text).data, 'Buy cookies');
    expect((fourthTextWidget as Text).data, 'Buy milk');

    //Next verify that tasks are ordered correctly by name
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskListDisplay(
          taskList: taskList,
          sortBy: SortBy.name,
        ),
      ),
    ));
    expect(tasksCaptions, findsNWidgets(4));
    textWidgets = tester.widgetList(tasksCaptions);
    firstTextWidget = textWidgets.first;
    secondTextWidget = textWidgets.elementAt(1);
    thirdTextWidget = textWidgets.elementAt(2);
    fourthTextWidget = textWidgets.last;
    expect((firstTextWidget as Text).data, 'Buy cookies');
    expect((secondTextWidget as Text).data, 'Buy milk');
    expect((thirdTextWidget as Text).data, 'Get the job');
    expect((fourthTextWidget as Text).data, 'Submit challenge');

    //And finally verify that tasks are ordered correctly by priority
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskListDisplay(
          taskList: taskList,
          sortBy: SortBy.priority,
        ),
      ),
    ));
    expect(tasksCaptions, findsNWidgets(4));
    textWidgets = tester.widgetList(tasksCaptions);
    firstTextWidget = textWidgets.first;
    secondTextWidget = textWidgets.elementAt(1);
    thirdTextWidget = textWidgets.elementAt(2);
    fourthTextWidget = textWidgets.last;
    expect((firstTextWidget as Text).data, 'Buy milk');
    expect((secondTextWidget as Text).data, 'Buy cookies');
    expect((thirdTextWidget as Text).data, 'Submit challenge');
    expect((fourthTextWidget as Text).data, 'Get the job');
  });
}
