import 'package:flutter/material.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';

// ignore: must_be_immutable
class CreateTask extends StatelessWidget {
  CreateTask({super.key, Object? task});
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15.0),

            // header back button and more vert
            _buildHeader(context),

            const Center(
              child: Text(
                "Create New Task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30.0),

            // Gray color line break
            Divider(
              color: Colors.black.withOpacity(0.2),
              height: 1.0,
              thickness: 1.0,
            ),

            const SizedBox(height: 30.0),

            // read user input
            _buildTaskInput(),

            const SizedBox(height: 10.0),

            // Add Task button
            _buildAddTaskButton(context)
          ],
        ),
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
          const Icon(Icons.more_vert, size: 40),
        ],
      ),
    );
  }

  Container _buildTaskInput() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: Text(
              "Main Task Name",
              style: TextStyle(
                color: Color(0xFFEE6F57),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          TextField(
            key: const Key("taskName"),

            controller: taskTitleController,
            decoration: InputDecoration(
              hintText: 'UI/UX app Design',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: const EdgeInsets.all(15.0),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20.0),

          // Due Date with calendar icon

          const Padding(
            padding: EdgeInsets.only(
                bottom: 10, left: 10), // Adjust values as needed
            child: Text(
              "Due Date",
              style: TextStyle(
                color: Color(0xFFEE6F57),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          TextField(
            key: const Key("dueDate"),

            controller: dueDateController,
            decoration: InputDecoration(
              hintText: 'April 29,2023 12:30 AM',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: const EdgeInsets.all(15.0),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: const Icon(
                Icons.calendar_month,
                color: Color(0xFFEE6F57),
              ),
            ),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20.0),

          // Description input field
          const Padding(
            padding: EdgeInsets.only(
                bottom: 10, left: 10), // Adjust values as needed
            child: Text(
              "Description",
              style: TextStyle(
                color: Color(0xFFEE6F57),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            key: const Key("description"),

            controller: descriptionController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText:
                  'First I have to animate the logo and later prototyping my design. It\'s very importand',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: const EdgeInsets.all(12.0),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildAddTaskButton(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            key: const Key("addButton"),
            onPressed: () {
              // Retrieve user input
              String taskTitle = taskTitleController.text;
              String dueDate = dueDateController.text;
              String description = descriptionController.text;
              if (taskTitle.isNotEmpty &&
                  dueDate.isNotEmpty &&
                  description.isNotEmpty) {
                String iconText = taskTitle[0];
                TaskModel newTask = TaskModel(
                  iconText: iconText, // You can set appropriate values here
                  titleText: taskTitle,
                  descriptionText: description,
                  dateText: dueDate,
                  taskId: taskTitle,
                  taskColor:
                      Colors.grey, // Set default color or specify as needed
                );

                // Pass the new task back to the Todo List page
                Navigator.pop(context, newTask);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEE6F57), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              minimumSize: const Size(180, 50), // Adjust the size
            ),
            child: const Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
