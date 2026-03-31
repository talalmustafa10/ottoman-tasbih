import 'package:flutter/material.dart';
import 'home_page.dart'; // This tells main.dart where to find your Home Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ottoman Tasbih',
      home: HomePage(), // Starts the app on the HomePage
    );
  }
}