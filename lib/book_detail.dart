import 'package:flutter/material.dart';
import "package:james_childrens_app/models/book.dart";

class BookDetailScreen extends StatefulWidget {
  // const BookDetailScreen({Key key, this.book}) : super(key: key);
  @override
  _BookDetailState createState() => new _BookDetailState();
}

class _BookDetailState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Book detail")),
        body: new Container(
            child: new SingleChildScrollView(
                child: new ConstrainedBox(
      constraints: new BoxConstraints(),
      child: new Column(children: <Widget>[
        new Image.network("https://placeimg.com/640/480/nature"),
        new Container(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
          color: Colors.grey,
          child: new Text(
            'Cast Light life style Here',
            textDirection: TextDirection.ltr,
            style: new TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
          child: new Text(
            'Hi There ? this is sample plaid app using flutter sdk and dart programming language, devceloper is Hammad Tariq'
                'this is sample Flutter app example Code'
                'Flutter Column Widget scrollable using SingleChildScrollView'
                'I am just loving Flutter SDK'
                'Flutter scrollview example using Single Child Scroll View'
                'flutter fixing bottom overflow by xx pixels in flutter'
                'Flutter scrollable layout example'
                'Flutter app SingleChildScrollView Example ',
            textDirection: TextDirection.ltr,
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        )
      ]),
    ))));
  }
}