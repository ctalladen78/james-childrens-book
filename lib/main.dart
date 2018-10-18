import 'package:flutter/material.dart';
import 'package:james_childrens_app/routes.dart';

void main() => runApp(new MyApp());
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

