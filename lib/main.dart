import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Todo(),
      ),
    );
  }
}
