import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser!;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> addTodo({
    required Todo todo,
    required onSuncess,
    required onError,
  }) async {
    setIsLoading(true);
    try {
      await _db
          .collection("Users")
          .doc(_user.uid)
          .collection("Todos")
          .add(todo.toJson());

      setIsLoading(false);
      onSuncess();
    } catch (e) {
      setIsLoading(false);
      onError(e.toString());
    }
  }

  //Get all todos
  Future<void> getAllTodos(
    Function onError,
    Function onSucess,
  ) async {
    setIsLoading(true);
    try {
      final querySnapshot = await _db
          .collection("Users")
          .doc(_user.uid)
          .collection("Todos")
          .get();

      final todos = querySnapshot.docs
          .map((e) => Todo.fromJson(e.data(), id: e.id))
          .toList();

      _todos = todos;
      onSucess();
      setIsLoading(false);
    } catch (e) {
      onError(e.toString());
    } finally {
      setIsLoading(false);
    }
  }
}
