import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/create_task.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/todo_list.dart';

void main() {
  // 2. Test Task Creation
  testWidgets('Task creation test', (WidgetTester tester) async {
    final addButton = find.byKey(const ValueKey("addButton"));
    final taskNameInputField = find.byKey(const ValueKey("taskName"));
    final dueDateInputField = find.byKey(const ValueKey("dueDate"));
    final taskDescriptionInputField = find.byKey(const ValueKey("description"));

    //execute the actual test
    await tester.pumpWidget(MaterialApp(home: CreateTask()));
    await tester.enterText(taskNameInputField, "Make Widget");
    await tester.enterText(dueDateInputField, "April 2014");
    await tester.enterText(
        taskDescriptionInputField, "Make Widget Testing Video");
    await tester.tap(addButton);
    await tester.pump(); //rebuilds your widget

    //check outputs
    expect(find.text("Make Widget"), findsOneWidget);
  });
  testWidgets('Task creation test with empty field',
      (WidgetTester tester) async {
    final addButton = find.byKey(const ValueKey("addButton"));
    final taskNameInputField = find.byKey(const ValueKey("taskName"));
    final dueDateInputField = find.byKey(const ValueKey("dueDate"));
    final taskDescriptionInputField = find.byKey(const ValueKey("description"));

    //execute the actual test
    await tester.pumpWidget(MaterialApp(home: CreateTask()));
    await tester.enterText(taskNameInputField, "");
    await tester.enterText(dueDateInputField, "April 2014");
    await tester.enterText(
        taskDescriptionInputField, "Make Widget Testing Video");
    await tester.tap(addButton);
    await tester.pump(); //rebuilds your widget

    //check outputs
    expect(find.text("April 2023"), findsNothing);
  });

  // 3. Test Task Listing
  testWidgets('Task list widget test', (WidgetTester tester) async {
    // Create a list of sample tasks
    // ignore: unused_local_variable
    List<Task> tasks = [
      Task(
        iconText: 'U',
        titleText: 'UI/UX APP Design',
        descriptionText: 'UI/UX APP Design',
        dateText: 'April, 29, 2023',
        taskId: '1',
        taskColor: Colors.red,
      ),
      Task(
        iconText: 'P',
        titleText: 'Project Planning',
        descriptionText: 'UI/UX APP Design',
        dateText: 'May, 15, 2023',
        taskId: '2',
        taskColor: Colors.green,
      ),
    ];

    // Build the TodoList widget with the sample tasks
    await tester.pumpWidget(
      const MaterialApp(
        home: TodoList(),
      ),
    );

    // Verify that the task titles are displayed
    expect(find.text('UI/UX APP Design'), findsOneWidget);
    expect(find.text('Project Planning'), findsOneWidget);

    // Verify that the task creation button is displayed
    expect(find.widgetWithText(ElevatedButton, 'Create Task'), findsOneWidget);
  });

  // 4. Verify that you're back on the TodoList page
  testWidgets('Navigation to main TodoList page from CreateTask', (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    initialRoute: '/todo-list', // Set the initial route
    routes: {
      '/todo-list': (context) => const TodoList(),
      '/create-task': (context) => CreateTask(),
    },
  ));

  // Tap the "Create Task" button to navigate to the CreateTask page
  await tester.tap(find.widgetWithText(ElevatedButton, 'Create Task'));
  await tester.pumpAndSettle(); // Wait for navigation and widget rebuild

  // Verify that you're on the CreateTask page
  expect(find.text('Create New Task'), findsOneWidget);

  // Tap the back arrow to navigate back to the TodoList page
  await tester.tap(find.byIcon(Icons.arrow_back_ios));
  await tester.pumpAndSettle(); // Wait for navigation and widget rebuild

  // Verify that you're back on the TodoList page
  expect(find.text('Task List'), findsOneWidget);
});


}
