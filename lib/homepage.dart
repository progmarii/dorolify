import 'package:flutter/material.dart';
import 'package:dorolfy/pages/home.dart';
import 'package:dorolfy/pages/calendar.dart';
import 'package:dorolfy/pages/pomo.dart';
import 'package:dorolfy/pages/todo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const CalendarWidget(),
    const PomodoroTimer(),
    const TodoList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          onTap: _navigateBottomBar,
          height: 50.0,
          backgroundColor: const Color.fromARGB(255, 223, 202, 161),
          color: const Color(0xFFebdcbe),
          items: const [
            Icon(Icons.home),
            Icon(Icons.calendar_month),
            Icon(Icons.lock_clock_rounded),
            Icon(Icons.message),
          ]),
    );
  }
}
