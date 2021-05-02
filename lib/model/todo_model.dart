class TodoModel {
  final String id;
  final String todo;
  final DateTime date;
  bool isCompleted;

  TodoModel({this.id, this.todo, this.date, this.isCompleted = false});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
