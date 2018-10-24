import 'package:flutter/material.dart';
import 'package:james_childrens_app/routes.dart';
import 'package:james_childrens_app/services/db_service.dart';
import 'package:flutter/services.dart';


void main() async {
  DatabaseService databaseService = new DatabaseService();
  databaseService.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
  // runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue,),
      routes: new Routes(context).routes,
    );
  }
}

