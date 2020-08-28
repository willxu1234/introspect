import 'package:flutter/material.dart';
import 'package:introspect/models/entries.dart';
import 'package:introspect/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EntriesModel(),
      child: MyApp(),
    ),
  );
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
