import 'package:flutter/material.dart';
import 'package:dorolfy/pages/home.dart';
import 'package:dorolfy/pages/calendar.dart';
import 'package:dorolfy/pages/pomo.dart';
import 'package:dorolfy/pages/todo.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer), label: 'Pomodoro Timer'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: 'To Do Lists'),
        ],
      ),
    );
  }
}
