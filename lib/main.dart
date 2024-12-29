import 'package:flutter/material.dart';
import 'package:flutter_example/components/layouts/main_layout.dart';
import 'package:flutter_example/components/providers/global_bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainLayout(),
    ));
  }
}
