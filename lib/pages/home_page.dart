import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> tasks = [
    "Learn programming",
    "Pick up kids",
    "Lunch",
    "Go visit mom"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang Di Aplikasi Todo List"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.check_box_outline_blank),
              title: Text(tasks[index]),
            ),
          );
        },
      ),
    );
  }
}