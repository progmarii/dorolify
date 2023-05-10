import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final List<String> _todoItems = [];

  void _addTodoItem(String task) {
    setState(() {
      _todoItems.add(task);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
        return null;
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return ListTile(
      title: Text(todoText),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Add a new task'),
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFebdcbe),
                    Color(0xFFdecaa2),
                    Color(0xFFded2ba),
                    Color(0xFFdbcdbf),
                    Color(0xFFdecaa2),
                    Color(0xFFebdcbe),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: TextField(
                autofocus: true,
                onSubmitted: (val) {
                  _addTodoItem(val);
                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  hintText: 'Enter something to do...',
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // to make it transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('To-Do List'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFebdcbe),
              Color(0xFFdecaa2),
              Color(0xFFded2ba),
              Color(0xFFdbcdbf),
              Color(0xFFdecaa2),
              Color(0xFFebdcbe),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _buildTodoList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
