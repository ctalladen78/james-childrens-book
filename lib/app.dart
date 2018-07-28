
import 'package:flutter/material.dart';
import 'package:firebase_tutorial2/screens/auth_screen.dart';
import 'package:firebase_tutorial2/screens/home_screen.dart';

class AppRootWidget extends StatefulWidget {
  @override
  AppRootWidgetState createState() => new AppRootWidgetState();
}

class AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => ThemeData(
    primaryColor: Colors.cyan,
    accentColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[300],
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inherited',
      theme: _themeData,
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/auth': (BuildContext context) => new AuthScreen(),
      },
    );
  }
}