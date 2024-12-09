import 'package:flutter/material.dart';
import 'package:translate/dashboardpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(51, 0, 102, 1),
        primaryColor: Colors.purple[800],
        hintColor: Colors.pinkAccent,
      ),
      home: const DashboardPage(),
    );
  }
}
