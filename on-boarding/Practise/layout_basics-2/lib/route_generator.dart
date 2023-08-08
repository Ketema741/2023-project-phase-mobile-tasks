import 'package:flutter/material.dart';
import 'package:layout_basics/create_task.dart';
import 'package:layout_basics/main.dart';
import 'package:layout_basics/task_detail.dart';
import 'package:layout_basics/todo_list.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const MyApp());
      case "/todo-list":
        return MaterialPageRoute(builder: (_) =>  TodoList());
      case "/task-detail":
        return MaterialPageRoute(builder: (_) =>   TaskDetail());
      case "create-task":
        if (args is String) {
          return MaterialPageRoute(builder: (_) => const CreateTask());
        }
        return _errorRoute();
      default:
        return _errorRoute();
        
    }

  }

  static Route<dynamic>_errorRoute(){
    return MaterialPageRoute(builder:(_) {
      return(
        Scaffold(
          appBar: AppBar(
            title:const Text("Text error"),
          ),
          body: const Center(child: Text("error")),
        )
      );
    });
  }
}

