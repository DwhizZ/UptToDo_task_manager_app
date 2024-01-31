class TodoCategory {
  final String categoryName;
  final String iconName;
  final String color;

  TodoCategory({
    required this.categoryName,
    required this.iconName,
    required this.color,
  });

  factory TodoCategory.fromJson(Map<String, dynamic> json) {
    return TodoCategory(
      categoryName: json['categoryName'],
      iconName: json['iconName'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'iconName': iconName,
      'color': color,
    };
  }
}