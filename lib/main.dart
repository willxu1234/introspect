import 'package:flutter/material.dart';
import 'package:introspect/src/routes/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introspect',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
