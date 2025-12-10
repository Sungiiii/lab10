import 'package:flutter/material.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 10',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}