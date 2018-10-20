import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import "package:james_childrens_app/book_list.dart"; // TODO implement book list
import "package:james_childrens_app/services/model_builder.dart";
import "package:james_childrens_app/models/book.dart";
import "package:james_childrens_app/services/webview.dart" show WebView;

class BookGridScreen extends StatefulWidget {
  BookGridScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// TODO finish layout with static data from json file
class _MyHomePageState extends State<BookGridScreen> {
  // TODO model service get all books json
  ModelBuilder _modelBuilder;

  Widget _buildBookThumbnail(Book book){
    return new GestureDetector( 
      onTap:(){
        // String link = book.link;
        String link = "https://www.gutenberg.org";
        print("LINK $link");
        
        Navigator.push(context, new MaterialPageRoute(
                  builder : (context) => new WebView(link).view
                ));
        
      },
      child: new Container(
                    width: 250.0,
                    margin: new EdgeInsets.all(5.0),
                    child: new Image.network(book.preview, fit: BoxFit.cover)
                  )
                  );
  }

  Widget _buildHorizontalList(BuildContext context, String category){
    return new FutureBuilder(
      future: _modelBuilder.getBooksByCategory(category),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) { return new Center(child: new CircularProgressIndicator()); }
        List<Book> list = snapshot.data;
        // print("SNAP category $category");
        return new Container(
          padding: EdgeInsets.all(20.0),
          height: 310.0,
          child: new Column(
            children: <Widget>[
              new Text(category),
              new Container(height: 250.0, child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context,  index) {
                  return _buildBookThumbnail(list[index]);
                }
              ))

            ],
            )
          );
      },
    );
  }

  @override
  void initState() {
    _modelBuilder = new ModelBuilder();
  }
  // TODO scrolling listview of nested horizontal listviews
  // main list vertical scroll
  Widget _buildBody(BuildContext context){
    return new FutureBuilder(
      future: _modelBuilder.getCategoryList(),
      // snapshot data should contain list of categories
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) {return new Center(child: new CircularProgressIndicator());}
        List<String> list = snapshot.data;
        
        return new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverAppBar(title: new Text("Book Search")),
            
            new SliverList(
              delegate: new SliverChildBuilderDelegate((context, index){
                return _buildHorizontalList(context, list[index]);
              }, childCount: list.length),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: _buildBody(context), 
    );

  }
}