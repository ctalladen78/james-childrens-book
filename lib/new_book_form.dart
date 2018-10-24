import 'package:flutter/material.dart';
import "package:james_childrens_app/services/db_service.dart";
import 'package:james_childrens_app/services/model_builder.dart' show ModelBuilder, AppModel;


class BookCreateScreen extends StatefulWidget {
  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<BookCreateScreen> {
  // ModelBuilder _modelBuilder; // get user info from db
  // LoginService _loginService; // logout

  @override
  void initState() {
    super.initState();
    // _modelBuilder = new ModelBuilder();
    // _modelBuilder.getUserProfile();
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView( // TODO new book form with image upload
      child: new Center(
        child: new Column(
          children: <Widget>[
            // new Stack(), // circleAvatar with background
            new Text("book create form") // name, email, 
          ],
        ),
      ),);
  }
}