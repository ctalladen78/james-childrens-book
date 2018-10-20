import 'package:flutter/material.dart';
import 'package:james_childrens_app/login_screen.dart';
import 'package:james_childrens_app/book_grid_screen.dart';
import 'package:james_childrens_app/home_container.dart';
import 'package:james_childrens_app/services/webview.dart' show WebView;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Routes {
  var _routes;
  Map<String, WidgetBuilder> get routes => _routes;
  Routes(BuildContext context) {
    _routes = <String, WidgetBuilder>{
      // "/" : (context) => new LoginScreen(),
      "/": (context) => new HomeScreen(),
      "/books_grid" : (context) => new BookGridScreen(),
      "/home_screen" : (context) => new HomeScreen(),
      // "/books_detail" : (context) => new BookDetailScreen(),
      // "/books_create" : (context) => new BookCreateScreen(),
      // "/profile" : (context) => new ProfileScreen(),
      // "/webview" : (context) => new WebView().view,
      // "/webview" : (context) => new WebviewScaffold(
      //         url: selectedUrl,
      //         appBar: new AppBar(
      //           title: const Text('Widget webview'),
      //         ),
      //         // withZoom: true,
      //         // withLocalStorage: true,
      //         withJavascript: true,
      //       )
    };
  }
}