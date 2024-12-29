import 'package:flutter_example/models/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<List<Todo>> getTodoById(int id);
  Future<Todo> add(Todo todo);
  Future<void> update(int id, Todo todo);
  Future<void> delete(int id, Todo todo);
}
