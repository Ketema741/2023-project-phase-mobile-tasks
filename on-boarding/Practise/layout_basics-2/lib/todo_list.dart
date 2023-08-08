import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final List<Task> tasks = [
    Task(
      iconText: 'U',
      taskText: 'UI/UX APP Design',
      dateText: 'April, 29, 2023',
      taskColor: Colors.red,
    ),
    Task(
      iconText: 'P',
      taskText: 'Project Planning',
      dateText: 'May, 15, 2023',
      taskColor: Colors.green,
    ),
    // Add more tasks here
  ];

   TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            _buildHeader(),
            const SizedBox(height: 10.0),
            _buildImage(),
            const SizedBox(height: 4.0),
            const Text(
              'Task List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTaskList(),
            const SizedBox(height: 20.0),
            _buildCreateTaskButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 40,
            color: Color(0xFFEE6F57),
          ),
          Center(
            child: Text(
              "Todo List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Icon(Icons.more_vert, size: 40),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'images/todo_list.jpeg',
        width: 483,
        height: 150,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          return _buildTaskItem(tasks[index]);
        },
      ),
    );
  }

  Widget _buildTaskItem(Task task) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 63, 59, 59).withOpacity(0.09),
        ),
      ),
      height: 70,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTaskInfo(task.iconText, task.taskText),
          const SizedBox(width: 20),
          _buildDateInfo(task.dateText, task.taskColor),
        ],
      ),
    );
  }

  Widget _buildTaskInfo(String iconText, String taskText) {
    return SizedBox(
      width: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            iconText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              taskText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateInfo(String dateText, Color dividerColor) {
    return SizedBox(
      width: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              dateText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 3),
          Container(
            width: 5,
            decoration: BoxDecoration(
              color: dividerColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const VerticalDivider(
              width: 1,
              thickness: 5.0,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateTaskButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // create task logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEE6F57),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            minimumSize: const Size(250, 50),
          ),
          child: const Text(
            'Create Task',
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
}

class Task {
  final String iconText;
  final String taskText;
  final String dateText;
  final Color taskColor;

  Task({
    required this.iconText,
    required this.taskText,
    required this.dateText,
    required this.taskColor,
  });
}
