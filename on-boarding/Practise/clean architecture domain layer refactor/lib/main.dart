import 'package:flutter/material.dart';
import 'package:layout_basics/features/todo/presentation/pages/create_task_screen.dart';
import 'package:layout_basics/features/todo/presentation/pages/edit_screen.dart';
import 'package:layout_basics/features/todo/presentation/pages/task_detail_screen.dart';
import 'package:layout_basics/features/todo/presentation/pages/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == '/task-detail') {
          final task = settings.arguments;
          return MaterialPageRoute(builder: (context) =>  DetailScreen(task: task));
        }
        if (settings.name == '/edit-task') {
          final task = settings.arguments;
          return MaterialPageRoute(builder: (context) =>  EditTask(task: task));
        }
        // You can return different routes or handle unknown routes as needed.
        return null;
      },
      routes: {
        '/': (context) => const MyHomePage(),
        '/todo-list': (context) => const TodoList(),
        '/create-task': (context) => CreateTask(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEE6F57),
      body: Column(
        children: [
          const SizedBox(height: 97.92), // Adjust the spacing
          Image.asset(
            'images/drawing.jpeg',
            width: 483, // Adjusted width
            height: 320, // Adjusted height
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 120), // Adjust the spacing
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/todo-list');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              minimumSize: const Size(256, 50), // Adjust the size
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
