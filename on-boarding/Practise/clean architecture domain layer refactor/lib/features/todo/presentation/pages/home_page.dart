

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              context.read<TaskBloc>().add(const LoadTasks()); // Dispatch the event
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
