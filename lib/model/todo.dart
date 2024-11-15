class Todo {
  String? id;
  String? todotext;
  bool isdon;
  Todo({required this.id, required this.todotext, this.isdon = false});
  static List<Todo> todolist() {
    return [
      Todo(id: "01", todotext: "Morning Exercises", isdon: true),
      Todo(id: "02", todotext: "DO Study", isdon: true),
      Todo(id: "03", todotext: "Check Emails"),
      Todo(id: "04", todotext: "Do assigments "),
      Todo(id: "05", todotext: "To work on skills"),
      Todo(id: "06", todotext: "prepare Quizes")
    ];
  }
}
