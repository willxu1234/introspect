import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          // brightness: Brightness.dark,
          // primaryColor: Colors.deepPurple[300],
          // primaryColor: Colors.grey[800],
          primaryColor: Colors.black,
          // accentColor: Colors.grey[800],
          accentColor: Colors.black,
          textTheme: GoogleFonts.notoSansTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // For bottom bar navigation.
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          // TODO: Add new routes.
          '/graph': (context) => HomePage(),
          '/legend': (context) => HomePage(),
        });
  }
}
