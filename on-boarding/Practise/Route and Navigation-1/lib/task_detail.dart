import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  final Task task;

  const TaskDetail({required this.task, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)?.settings.arguments as Task;

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            _buildHeader(context),
            const SizedBox(height: 10.0),
            _buildTaskImage(task.imageUrl),
            const SizedBox(height: 20.0),
            _buildDetailContainer(
              title: 'Title',
              detail: task.title,
            ),
            const SizedBox(height: 10.0),
            _buildDetailContainer(
              title: 'Description',
              detail: task.taskText,
              containerHeight: 100, // Longer height for description
            ),
            const SizedBox(height: 10.0),
            _buildDetailContainer(
              title: 'Deadline',
              detail: task.dateText,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 40,
              color: Color(0xFFEE6F57),
            ),
          ),
          const Center(
            child: Text(
              "Todo List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Icon(Icons.more_vert, size: 40),
        ],
      ),
    );
  }

  Widget _buildTaskImage(String imageUrl) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        imageUrl,
        width: 300,
        height: 150,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildDetailContainer(
      {required String title,
      required String detail,
      double containerHeight = 50}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: containerHeight,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey[200], // Gray background color
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromARGB(255, 63, 59, 59).withOpacity(0.09),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              detail,
              style: const TextStyle(
                fontSize: 16, // Increased font size
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Task {
  final String iconText;
  final String taskText;
  final String dateText;
  final Color dividerColor;
  final String imageUrl;
  final String title;
  final String description;

  Task({
    required this.iconText,
    required this.taskText,
    required this.dateText,
    required this.dividerColor,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
