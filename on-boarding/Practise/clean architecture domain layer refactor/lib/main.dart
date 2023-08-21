import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_basics/features/todo/presentation/pages/edit_screen.dart';
import 'package:layout_basics/features/todo/presentation/pages/task_detail_screen.dart';
import 'package:layout_basics/features/todo/presentation/pages/todo_list_screen.dart';
import 'features/todo/presentation/bloc/task_bloc.dart';
import 'features/todo/presentation/pages/create_task_screen.dart';
import 'features/todo/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize the binding
  await di.init(); // Call the setupLocator function to register dependencies
  runApp(
    const TaskApp(),
  );
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (context) => di.sl<TaskBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: (settings) {
          if (settings.name == '/task-detail') {
            final task = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => DetailScreen(task: task));
          }
          if (settings.name == '/edit-task') {
            final task = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => EditTask(task: task));
          }
          // You can return different routes or handle unknown routes as needed.
          return null;
        },
        routes: {
          '/': (context) => const HomePage(),
          '/todo-list': (context) =>  TodoList(),
          '/create-task': (context) => CreateTaskPage(),
        },
      ),
    );
  }
}
