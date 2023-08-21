import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';

import '../bloc/task_bloc.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);

  // final List<TaskModel> tasks = [
  //   const TaskModel(
  //     iconText: 'U',
  //     titleText: 'UI/UX APP Design',
  //     descriptionText: 'UI/UX APP Design',
  //     dateText: 'April, 29, 2023',
  //     taskId: '1',
  //     taskColor: Colors.red,
  //     isCompleted: true,
  //   ),
  //   const TaskModel(
  //     iconText: 'P',
  //     titleText: 'Project Planning',
  //     descriptionText: 'UI/UX APP Design',
  //     dateText: 'May, 15, 2023',
  //     taskId: '2',
  //     taskColor: Colors.green,
  //     isCompleted: false,
  //   ),
  // ];
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
            _buildHeader(context),
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
            _buildCreateTaskButton(context),
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
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        //  implement listener
      },
      builder: (context, state) {
        List<TaskModel> loadedTasks;
        if (state is TaskLoaded && state.tasks.isNotEmpty) {
           loadedTasks = state.tasks;
        } else {
          return const Center(
            child: Text("No task"),
          );
        }
        return Expanded(
          child: ListView.separated(
            itemCount: loadedTasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return _buildTaskItem(loadedTasks[index], index,
                  deleteFunction: (context) => deleteTask(index));
            },
          ),
        );
      },
    );
  }

  bool isExpanded = false;
  Widget _buildTaskItem(TaskModel task, int index,
      {required Function(dynamic context) deleteFunction}) {
    return GestureDetector(
      onTap: () {},
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.edit_document,
              backgroundColor: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(255, 63, 59, 59).withOpacity(0.09),
            ),
          ),
          height: 90, // Adjust the expanded height as needed
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTaskInfo(
                task.iconText,
                task.isCompleted,
                task.titleText,
                onChanged: (value) => checkBoxChanged(value, index),
              ),
              const SizedBox(width: 20),
              _buildDateInfo(task.dateText, task.taskColor),
              // if (showIconsMap[index] ?? false)
              //   Stack(
              //     children: [
              //       Column(
              //         children: [
              //           IconButton(
              //             onPressed: () async {
              //               final editedTask = await Navigator.pushNamed(
              //                   context, '/edit-task',
              //                   arguments: task);

              //               if (editedTask != null && editedTask is Task) {
              //                 setState(() {
              //                   // Find the task in the tasks list and update it
              //                   int indexOfTask = tasks.indexWhere(
              //                       (task) => task.taskId == editedTask.taskId);
              //                   if (indexOfTask != -1) {
              //                     debugPrint("here");
              //                     tasks[indexOfTask] = editedTask;
              //                   } else {
              //                     debugPrint("not ear");
              //                   }
              //                 });
              //               }
              //             },
              //             icon: const Icon(Icons.edit),
              //           ),
              //           IconButton(
              //             onPressed: () {
              //               Navigator.pushNamed(context, '/task-detail',
              //                   arguments: task);
              //             },
              //             icon: const Icon(Icons.more_vert),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskInfo(String iconText, bool isComleted, String titleText,
      {required Function(dynamic value) onChanged}) {
    return SizedBox(
      width: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isComleted,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              titleText,
              style: TextStyle(
                decoration: isComleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
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
        crossAxisAlignment: CrossAxisAlignment.center,
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

  Widget _buildCreateTaskButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          key: const Key("createTask"),
          onPressed: () async {
            final newTask =
                await Navigator.of(context).pushNamed('/create-task');
            if (newTask != null && newTask is TaskModel) {
              // Add the new task to the tasks list
            }
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

  deleteTask(int index) {}

  checkBoxChanged(value, int index) {}
}
