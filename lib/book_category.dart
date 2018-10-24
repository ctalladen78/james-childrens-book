import 'package:flutter/material.dart';
import "package:james_childrens_app/services/model_builder.dart";
import "package:james_childrens_app/models/book.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:james_childrens_app/services/model_builder.dart' show CustomBookListModel, ModelBuilder, AppModel;

class BookCategoryScreen extends StatelessWidget {
  final AppModel appModel = new AppModel();
  final ModelBuilder _modelBuilder = new ModelBuilder();
  final String category;
  BookCategoryScreen(this.category);

  Future<Null> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildBookThumbnail(Book book){
    return new GestureDetector( 
      onTap:(){
        // String link = book.link;
        // String link = "https://www.gutenberg.org";
        // String link = "http://www.childrenslibrary.org";
        // String link = "https://play.google.com/store/books/details?id=bQKCBgAAQBAJ";
        // print("LINK $link");
        
        // Navigator.push(context, new MaterialPageRoute(
        //           builder : (context) => new WebView(link).view
        //         ));
        _launchInBrowser(book.link);
        
      },
      child: new Card( 
        color: Colors.lightBlue,
        child: new Container(
                    width: 150.0,
                    margin: new EdgeInsets.all(5.0),
                    child: new Column(
                       children: <Widget>[
                         Image.network(book.preview, 
                      // fit: BoxFit.cover, 
                      // width: 50.0, 
                      height: 100.0,
                      ),
                      new Text(book.title),
                      new Text(book.author)
                       ],
                      ),
                  ))
                  );
  }

  Widget _buildHorizontalList(){
    return new FutureBuilder(
      future: _modelBuilder.getBooksByCategory(category),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) { return new Center(child: new CircularProgressIndicator()); }
        List<Book> list = snapshot.data;
        return new Container(
          padding: EdgeInsets.all(20.0),
        // height: 250.r0, 
        child: new ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context,  index) {
                  return _buildBookThumbnail(list[index]);
                }
              )
              );

      },
    );
  }
  Widget _buildBookDetail(Book book) {
    return GestureDetector(
      onTap: (){ _launchInBrowser(book.link);},
      child: new Card( color: Colors.teal, child: new Container(
          padding: EdgeInsets.all(20.0),
          height: 310.0,
          child: new Row(
            children: <Widget>[
              new Text(book.title),
              new Image.network(book.link)
              ],
            )
          )
        ));
  }

  
  // main list vertical scroll
  Widget _buildBody(BuildContext context){
    return new FutureBuilder(
      future: _modelBuilder.getBooksByCategory(category),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) {return new Center(child: new CircularProgressIndicator());}
        List<Book> list = snapshot.data;
        return new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverAppBar(title: new Text(category)),
            
            new SliverList(
              delegate: new SliverChildBuilderDelegate((context, index){
                _buildBookDetail(list[index]);
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
      appBar: new AppBar(title: new Text(category)),
      body: _buildHorizontalList(), 
    );

  }
}