
import 'package:flutter/material.dart';
import 'package:firebase_tutorial2/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  AuthScreenState createState() {
    return new AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return new Container(
      width: width, 
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeScreen()));
            }, 
            color: Colors.white,
            child: new Container(
              width: 230.0,
              height: 50.0,
              alignment: Alignment.center,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: new Image.network(
                      'http://diylogodesigns.com/blog/wp-content/uploads/2016/04/google-logo-icon-PNG-Transparent-Background.png',
                      width: 30.0,
                    ),
                  ),
                  new Text(
                    'Sign In With Google',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 16.0,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}