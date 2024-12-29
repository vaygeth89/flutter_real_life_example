import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/http_clients/application_http_client.dart';
import 'package:flutter_example/interfaces/todo_repository.dart';
import 'package:flutter_example/repositories/fake_authentication_repository.dart';
import 'package:flutter_example/repositories/todo_api_repository.dart';
import 'package:flutter_example/states/authentication_cubit.dart';
import 'package:flutter_example/states/todo_cubit.dart';

class GlobalBlocProvider extends StatelessWidget {
  final Widget child;
  GlobalBlocProvider({super.key, required this.child});

  final TodoRepository todoRepository = TodoApiRepository(
      ApplicationHttpClient("https://jsonplaceholder.typicode.com/todos").dio);
  final AuthenticationCubit authCubit =
      AuthenticationCubit(FakeAuthenticationApiRepository());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthenticationCubit>(
        create: (context) => authCubit,
      ),
      BlocProvider(create: (context) => TodoCubit(todoRepository))
    ], child: child);
  }
}
