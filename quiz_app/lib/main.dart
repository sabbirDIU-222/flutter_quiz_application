import 'package:flutter/material.dart';
import 'package:quiz_app/quizscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quiz application',
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: QuizApp(),
    );
  }
}
