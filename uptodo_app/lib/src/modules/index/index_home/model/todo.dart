import 'package:uptodo_app/src/modules/index/index_home/model/todo_category.dart';

class Todo {
  final String? id;
  final String title;
  final String description;
  final DateTime dateTime;
  final int priority;
  final TodoCategory category;
  final bool isDone;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.priority,
    required this.category,
    required this.isDone,
  });

  factory Todo.fromJson(Map<String, dynamic> json, {String? id}) {
    return Todo(
      id: id ?? json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['dateTime']),
      priority: json['priority'],
      category: TodoCategory.fromJson(json['category']),
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'priority': priority,
      'category': category.toJson(),
      'isDone': isDone,
    };
  }
}
