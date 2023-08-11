import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {

  // ignore: prefer_typing_uninitialized_variables
  final task;
  const DetailScreen({Key? key, this.task}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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

  Widget _buildCreateTaskButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            // final newTask =
            //     await Navigator.of(context).pushNamed('/create-task');
            // if (newTask != null && newTask is Task) {
            //   setState(() {
            //     tasks.add(newTask);
            //   });
            //   // Add the new task to the tasks list
            // }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEE6F57),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            minimumSize: const Size(250, 50),
          ),
          child: const Text(
            'Edit Task',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              _buildHeader(context),
              const SizedBox(height: 10.0),
              _buildTaskImage("images/task_detail.jpeg"),
              const SizedBox(height: 20.0),
              _buildDetailContainer(
                title: 'Title',
                detail: widget.task.titleText,
              ),
              const SizedBox(height: 10.0),
              _buildDetailContainer(
                title: 'Description',
                detail: widget.task.descriptionText,
                containerHeight: 80, // Longer height for description
              ),
              const SizedBox(height: 10.0),
              _buildDetailContainer(
                title: 'Deadline',
                detail: widget.task.dateText,
              ),
              _buildCreateTaskButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  Task({
    required this.iconText,
    required this.taskText,
    required this.dateText,
    required this.dividerColor,
    required this.imageUrl,
    required this.title,
    required this.description,
    required String descriptionText,
    required String titleText,
    required MaterialColor taskColor,
  });

  final String dateText;
  final String description;
  final Color dividerColor;
  final String iconText;
  final String imageUrl;
  final String taskText;
  final String title;
}
