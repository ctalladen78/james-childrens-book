
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Firebase login example'),
      ),
      body: new Center(
        // child: new Text(appState.user.displayName),
        child: new Text('User name')
      ),
    );
  }
}