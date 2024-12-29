import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/interfaces/todo_repository.dart';
import 'package:flutter_example/models/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;
  TodoCubit(this.todoRepository) : super(TodoInitialState());

  void getTodos() async {
    emit(TodoLoadingState());
    final todos = await todoRepository.getTodos();
    emit(TodoLoadedState(todos: todos));
  }

  void add(Todo todo) async {
    final todoResponse = await todoRepository.add(todo);
    List<Todo> todos = [];
    todos.addAll(state.todos);
    todos.insert(0, todoResponse);
    emit(TodoLoadedState(todos: todos));
  }

  void update(Todo todo) async {
    await todoRepository.update(todo.id, todo);
    List<Todo> todos = [];
    todos.addAll(state.todos);
    todos.firstWhere((element) => element.id == todo.id).completed =
        todo.completed;
    emit(TodoLoadedState(todos: todos));
  }

  void delete(Todo todo) async {
    await todoRepository.delete(todo.id, todo);
    List<Todo> todos = [];
    todos.addAll(state.todos);
    todos.removeWhere((element) => element.id == todo.id);
    emit(TodoLoadedState(todos: todos));
  }
}

class TodoState {
  final List<Todo> todos;
  const TodoState({this.todos = const []});
}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;
  TodoLoadedState({required this.todos});
}
