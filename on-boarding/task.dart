
class Task {
  String title;
  String description;
  DateTime dueDate;
  bool completed;

  Task(this.title, this.description, this.dueDate, {this.completed = false});

  void markAsCompleted() {
    completed = true;
  }

  void markAsPending() {
    completed = false;
  }

  @override
  String toString() {
    String statusEmoji = completed ? "✅" : "🕒";
    return '📌 Title: $title\n📝 Description: $description\n⏰ Due Date: $dueDate\n$statusEmoji Status: ${completed ? "Completed" : "Pending"}\n';
  }
}