class TodoData {
  final String description;
  final bool completed;
  final String id;

  TodoData({
    required this.id,
    required this.completed,
    required this.description,
  });

  factory TodoData.fromJson(Map<String, dynamic> json) {
    return TodoData(
        id: json['id'],
        completed: json['completed'],
        description: json['description']);
  }
}
