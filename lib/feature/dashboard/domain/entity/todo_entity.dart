class ToDoEntity {
  final int id;
  final String title;
  final bool completed;

  const ToDoEntity({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDoEntity.fromJson(Map<String, dynamic> json) {
    return ToDoEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
