import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import "package:james_childrens_app/book_list.dart"; // TODO implement book list
import "package:james_childrens_app/services/model_builder.dart";

class BookGridScreen extends StatefulWidget {
  BookGridScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// TODO finish layout with static data from json file
class _MyHomePageState extends State<BookGridScreen> {
  // TODO model service get all books json
  int _mainListItemCount = 0;
  ModelBuilder _modelBuilder;

  Widget _buildBookThumbnail(String preview){
    return Container(child: new Image.network(preview, fit: BoxFit.cover));
  }

  Widget _buildHorizontalList(BuildContext context, int index, category) {
    print("SNAP 3");
    return new FutureBuilder(
      future: _modelBuilder.getBooksByCategory(category),
      // snapshot data should contain list of books per category
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(!snapshot.hasData) {print("SNAP 2 $snapshot"); return new CircularProgressIndicator();}
        // return horizontal booklist
        return new ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext ctx, int idx) {
            String profile = snapshot.data[idx].profile;
            return new Container(
              // width: 100.0,
              margin: new EdgeInsets.all(5.0),
              // child: new NetworkImage(profile);
              child: new Text(profile),
            );
          }
        );
        
      }
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
        if(!snapshot.hasData) {print("SNAP 0 $snapshot"); return new Center(child: new CircularProgressIndicator());}
        List<String> list = snapshot.data;
        // return new ListView.builder(
        //   itemCount:snapshot.data.length,
        //     itemBuilder: (BuildContext ictx, int idx){
        //       //String profile = snapshot.data[idx].profile;
        //       String text = list[idx];
        //       return new ListTile(
        //         // leading: new CircleAvatar(backgroundImage: new NetworkImage(profile)),
        //         title: new Text(text),
        //         // subtitle: new Text(profile)
        //       );
        //     }
        // );
        return new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverAppBar(title: new Text("Book Search")),
            // new SliverFixedExtentList(
            //   itemExtent: 100.0,
            //   delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
            //     _buildHorizontalList(context, index, snapshot.data); // TODO how to get key value pair and pass into child widget
            //     return new Text(list[index]);
            //   }, childCount: _mainListItemCount),
            // ),
            new SliverList(
              delegate: new SliverChildBuilderDelegate((context, index){
                return new Text(list[index]);
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