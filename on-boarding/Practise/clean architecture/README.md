
```markdown
# Todo List App

This project is a basic Flutter application that showcases a Todo List app with UI layout design, navigation functionality, and custom icons.
["Design 1"]("images/completed_task.png")
["Design 2"]("images/delete_edit_task.png")
## Getting Started

This project is a starting point for building a Todo List app using Flutter.

To get started with Flutter development:

1. [Install Flutter](https://flutter.dev/docs/get-started/install) if you haven't already.
2. Clone this repository using Git:

   ```
   git clone <repository_url>
   ```

3. Navigate to the project directory:

   ```
   cd todo_list_app
   ```

4. Run the app on an emulator or connected device:

   ```
   flutter run
   ```

## Features

The `Todo List App` project includes the following features:

1. A task list page (`TodoList`) that displays a list of tasks.
2. Task details page (`TaskDetail`) showing detailed information about a selected task.
3. Adding new tasks to the list using the "Create Task" button.
4. Edit button on the task detail page to edit task properties.
5. A data model class (`Task`) to represent task information.


## Navigating and Editing Tasks

To navigate to the `TaskDetail` page with the task's details displayed:

1. In the `TodoList` widget, when a task is clicked, navigate to the `TaskDetail` page and pass the task as an argument:

   ```
   Navigator.pushNamed(
     context,
     '/task-detail',
     arguments: task,
   );
   ```

2. In the `TaskDetail` widget, retrieve the task data using the following code:

   ```
   final task = ModalRoute.of(context)?.settings.arguments as Task;
   ```

To edit a task's properties:

1. On the `TaskDetail` page, press the "Edit" button to enable editing mode.
2. Modify the task's properties and press "Save" to update the task.