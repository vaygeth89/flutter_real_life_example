import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/states/authentication_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthenticationCubit>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
            child: BlocConsumer(
                bloc: authCubit,
                builder: (context, authenticationState) {
                  if (authenticationState is AuthenticatedState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome ${authenticationState.data.name}'),
                      ],
                    );
                  } else if (authenticationState is AuthenticatingState) {
                    return CircularProgressIndicator();
                  }
                  return SignInForm();
                },
                listener: (context, authenticationState) {})),
        floatingActionButton: SignOutButton());
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthenticationCubit>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
        bloc: authCubit,
        builder: (context, authState) {
          return Form(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                TextFormField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordTextController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationCubit>().signIn(
                        _emailTextController.text,
                        _passwordTextController.text);
                  },
                  child: const Text('Sign In'),
                ),
                authState is AuthenticationErrorState
                    ? Text(authState.message,
                        style: const TextStyle(color: Colors.red))
                    : const SizedBox.shrink()
              ]));
        },
        listener: (context, authState) {});
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationState = context.read<AuthenticationCubit>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
        builder: (context, authState) {
          if (authState is AuthenticatedState) {
            return FloatingActionButton(
              onPressed: () {
                authenticationState.signOut();
              },
              tooltip: 'Sign Out',
              child: const Icon(Icons.exit_to_app),
            );
          }

          return const SizedBox.shrink();
        },
        listener: (context, authState) {});
  }
}
