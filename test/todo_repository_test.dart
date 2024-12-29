import 'package:flutter_example/http_clients/application_http_client.dart';
import 'package:flutter_example/interfaces/todo_repository.dart';
import 'package:flutter_example/models/todo.dart';
import 'package:flutter_example/repositories/todo_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TodoRepository todoRepository = TodoApiRepository(
      ApplicationHttpClient("https://jsonplaceholder.typicode.com/todos").dio);
  group("Testing Todo API Repositories", () {
    test('Get Todos', () async {
      final todos = await todoRepository.getTodos();
      expect(todos.length, 200);
    });

    test('Get Todo By Id', () async {
      final todos = await todoRepository.getTodos();
      List<Todo> todosById = await todoRepository.getTodoById(todos.first.id);
      expect(todosById.first.id, todos.first.id);
    });

    test('Add Todo', () async {
      final todo = await todoRepository
          .add(Todo(userId: 1, id: 201, title: "Test Todo", completed: false));
      expect(todo.id, 201);
    });

    test('Update Todo', () async {
      List<Todo> todos = await todoRepository.getTodos();
      Todo todoToUpdate = todos.first;
      todoToUpdate.completed = true;
      await todoRepository.update(todoToUpdate.id, todoToUpdate);
    });

    test('Delete Todo', () async {
      await todoRepository.delete(
          1, Todo(userId: 1, id: 1, title: "Test Todo", completed: false));
    });
  });
}
