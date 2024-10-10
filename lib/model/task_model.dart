class Task {
  String id;
  String title;
  String description;
  bool isCompleted;
  String creatorId;
  String assigneeId;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.creatorId,
    required this.assigneeId,
  });

  factory Task.fromJson(Map<dynamic, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['completed'],
      creatorId: json['creatorId'],
      assigneeId: json['assigneeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': isCompleted,
      'creatorId': creatorId,
      'assigneeId': assigneeId,
    };
  }
}
