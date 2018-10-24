import 'package:flutter/material.dart';
import "package:james_childrens_app/services/model_builder.dart";
import "package:james_childrens_app/models/book.dart";
import "package:james_childrens_app/services/webview.dart" show WebView;
import 'package:url_launcher/url_launcher.dart';
import 'package:james_childrens_app/book_category.dart';


class BookGridScreen extends StatefulWidget {
  BookGridScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<BookGridScreen> {
  ModelBuilder _modelBuilder;

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
      child: new Container(
                    width: 140.0,
                    margin: new EdgeInsets.all(5.0),
                    child: new Column(
                       children: <Widget>[
                         Image.network(book.preview, 
                      fit: BoxFit.cover, 
                      width: 110.0, 
                      height: 120.0,
                      ),
                      new Padding(padding: EdgeInsets.only(top: 5.0), child: new Text(book.title,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,)
                      )),
                      new Padding(padding: EdgeInsets.only(top: 5.0), child: new Text(book.author,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,)
                      ))
                       ],
                      ),
                  )
                );
  }

  Widget _buildHorizontalList(BuildContext context, String category){
    return new FutureBuilder(
      future: _modelBuilder.getBooksByCategory(category),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) { return new Center(child: new CircularProgressIndicator()); }
        List<Book> list = snapshot.data;
        return new Card( color: Colors.lightBlue, child: new Container(
          padding: EdgeInsets.all(20.0),
          height: 310.0,
          child: new Column(
            children: <Widget>[
              new Expanded(child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(right: 145.0), 
                    child: Text(category,
                      style: new TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    )
                  ),
                  // new Padding(padding: new EdgeInsets.only(top: 15.0),child: new GestureDetector(
                  //   child: new Text("See all", style: new TextStyle(color: Colors.black87)),
                  //   onTap: (){
                  //     print("$category");
                  //     Navigator.push(context, new MaterialPageRoute(
                  //       builder : (context) => new BookCategoryScreen(category)
                  //     ));
                  //   }
                  // ),)
                  new GestureDetector(
                      onTap: (){
                      print("$category");
                      Navigator.push(context, new MaterialPageRoute(
                        builder : (context) => new BookCategoryScreen(category)
                      ));
                      },
                      child: new Padding( 
                        padding: EdgeInsets.only(top: 15.0), 
                        child: new Text("See all", style: new TextStyle(color: Colors.black87)))
                    ),
                ],
              )),
              
              new Container(
                padding: EdgeInsets.only(top: 30.0),
                height: 250.0, child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context,  index) {
                  return _buildBookThumbnail(list[index]);
                }
              )
              )
            ],
            )
          )
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _modelBuilder = new ModelBuilder();
  }
  // main list vertical scroll
  Widget _buildBody(BuildContext context){
    return new FutureBuilder(
      future: _modelBuilder.getCategoryList(),
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