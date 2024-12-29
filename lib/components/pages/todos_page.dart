import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/models/todo.dart';
import 'package:flutter_example/cubits/todo_cubit.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoCubit todoCubit = context.watch<TodoCubit>();
    return Scaffold(
      body: BlocConsumer<TodoCubit, TodoState>(
        bloc: todoCubit,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TodoInitialState) {
            todoCubit.getTodos();
          }
          if (state is TodoInitialState || state is TodoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoadedState) {
            return TodosListView(data: state.todos);
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoCubit
              .add(Todo(userId: 1, id: 1, title: 'New Todo', completed: false));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodosListView extends StatelessWidget {
  final List<Todo> data;
  const TodosListView({super.key, this.data = const []});

  @override
  Widget build(BuildContext context) {
    final TodoCubit todoCubit = context.watch<TodoCubit>();
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final todo = data[index];
        return ListTile(
          leading: Switch(
              value: todo.completed,
              onChanged: (value) {
                todo.completed = value;
                todoCubit.update(todo);
              }),
          title: Text(todo.title),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              todoCubit.delete(todo);
            },
          ),
        );
      },
    );
  }
}
