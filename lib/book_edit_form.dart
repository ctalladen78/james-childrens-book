import 'package:flutter/material.dart';
import "package:james_childrens_app/services/model_builder.dart";


class BookEditScreen extends StatefulWidget {
  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<BookEditScreen> {
  ModelBuilder _modelBuilder; // _modelBuilder.createBook()

  @override
  void initState() {
    super.initState();
    _modelBuilder = new ModelBuilder();
    // _modelBuilder.createBook();
    // DatabaseService databaseService = new DatabaseService();
    // databaseService.deleteAll();
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView( // TODO edit books form with data prefilled from db
      child: new Center(
        child: new Column(
          children: <Widget>[
            // new Stack(), // circleAvatar with background
            new Text("book edit form") // name, email, 
          ],
        ),
      ),);
  }
}