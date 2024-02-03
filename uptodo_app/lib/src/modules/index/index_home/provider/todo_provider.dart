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

  List<Todo> _filteredTodos = [];

  List<Todo> get filteredTodos => _filteredTodos;

  void search(String text) {
    if (text.isEmpty) {
      _filteredTodos = _todos;
    } else {
      _filteredTodos = _todos
          .where((element) =>
              element.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

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
      getAllTodos(() {}, () {});
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
      search("");
      onSucess();
      setIsLoading(false);
    } catch (e) {
      onError(e.toString());
    } finally {
      setIsLoading(false);
    }
  }

  //Delete a todo
  Future<void> deleteTodo({
    required String id,
    required Function onError,
    required Function onSucess,
  }) async {
    //loading
    setIsLoading(true);
    try {
      await _db
          .collection("Users")
          .doc(_user.uid)
          .collection("Todos")
          .doc(id)
          .delete();

      getAllTodos(() {}, () {});
      onSucess();
    } catch (e) {
      onError("Error could not delete $e ");
      setIsLoading(false);
    } finally {
      setIsLoading(false);
    }
  }

  // Update a todo
  Future<void> updateTodo({
    required Todo todo,
    required Function onError,
    required Function onSucess,
  }) async {
    //loading
    setIsLoading(true);
    try {
      await _db
          .collection("Users")
          .doc(_user.uid)
          .collection("Todos")
          .doc(todo.id)
          .update(todo.toJson());

      onSucess();
      getAllTodos(() {}, () {});
      setIsLoading(false);
    } catch (e) {
      onError(e.toString());
      setIsLoading(false);
    }
  }
}
