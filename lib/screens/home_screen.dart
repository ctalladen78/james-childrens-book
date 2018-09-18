
import 'dart:async';
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
      body: new Container(
        // height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
        decoration: new BoxDecoration(color: Colors.blue[500]),
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 4,
              child: new Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                color: Colors.yellow,
                child: new Center(child: new Text("At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. "))
              ),
            ),
                new Expanded(
                  flex: 2,
                  child: new Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.yellow,
                    child: new Center(child: new Text("test"))
                  ),
                ),
                // https://www.raywenderlich.com/110-flutter-navigation-tutorial
                new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: (){ Navigator.pop(context);},
                )
          ],
        ),
      ),
    );
  }
}

// TODO how does context work when passing state into new pages
// TODO page routing
  /*
Future _goToNextPage() async {
  Navigator.of(context).push(new MaterialPageRoute<dynamic>(
    builder: (BuildContext context) {
      return new SecondPage();
    },
  ));
}
  */