import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:uptodo_app/src/globals/utilities/constants.dart';

import 'package:uptodo_app/src/modules/index/index_home/model/todo_category.dart';

final List<TodoCategory> _defaultCategories = [
  TodoCategory(categoryName: "Grocery", iconName: "groceryIcon", color: "red"),
  TodoCategory(categoryName: "Work", iconName: "workIcon", color: "orange"),
  TodoCategory(categoryName: "Sport", iconName: "sportIcon", color: "purple"),
  TodoCategory(categoryName: "Design", iconName: "designIcon", color: "green"),
  TodoCategory(
      categoryName: "University", iconName: "uniIcon", color: "indigo"),
  TodoCategory(categoryName: "Social", iconName: "socialIcon", color: "pink"),
  TodoCategory(categoryName: "Music", iconName: "musicIcon", color: "blue"),
];

class CategoryProvider extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser!;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<TodoCategory> _categories = [];

  List<TodoCategory> get categories => _categories; //TodoCategory

  /// This is only called the first time user opens the app
  Future<void> setNewDefaultCategories() async {
    List<Map<String, dynamic>> categories =
        _defaultCategories.map((e) => e.toJson()).toList();
    await _db
        .collection("Users")
        .doc(_user.uid)
        .set({"categories": categories});

    logger.d("Default categories created sucessfully");
  }

  //Get all categories
  Future<void> getAllCategories() async {
    setIsLoading(true);
    _categories.clear();
    await _db.collection("Users").doc(_user.uid).get().then((value) {
      _categories.addAll((value.data()!["categories"] as List<dynamic>)
          .map((e) => TodoCategory.fromJson(e))
          .toList());

      _categories = [
        ..._categories,

        ///We also need to be able to add new category but we are not going
        ///to save it to database,
        TodoCategory(
            categoryName: "Create New", iconName: "addIcon", color: "green"),
      ];
    }).whenComplete(() => setIsLoading(false));
  }

  /// Add new category
  Future<void> addCategory(TodoCategory category) async {
    setIsLoading(true);
    await _db.collection("Users").doc(_user.uid).update({
      "categories": FieldValue.arrayUnion([category.toJson()])
    }).whenComplete(() => setIsLoading(false));
  }
}
