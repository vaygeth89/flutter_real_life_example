import 'package:flutter/material.dart';
import 'package:flutter_example/components/pages/profile_page.dart';
import 'package:flutter_example/components/pages/todos_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedMenuIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedMenuIndex == 0 ? const TodosPage() : const ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedMenuIndex,
          onTap: (index) {
            setState(() {
              _selectedMenuIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Todos'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
