import 'package:flutter/material.dart';
import 'package:james_childrens_app/login_screen.dart';
import 'package:james_childrens_app/book_grid_screen.dart';
import 'package:james_childrens_app/home_container.dart';
import 'package:james_childrens_app/services/webview.dart' show WebView;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:james_childrens_app/new_book_form.dart';
import 'package:james_childrens_app/profile_screen.dart';
import 'package:james_childrens_app/book_edit_form.dart';
import 'package:james_childrens_app/book_detail.dart';
import 'package:james_childrens_app/book_category.dart';
import 'package:james_childrens_app/book_grid_screen.dart';


class Routes {
  var _routes;
  Map<String, WidgetBuilder> get routes => _routes;
  Routes(BuildContext context) {
    _routes = <String, WidgetBuilder>{
      "/" : (context) => new LoginScreen(),
      // "/": (context) => new HomeScreen(),
      "/books_grid_screen" : (context) => new BookGridScreen(),
      "/home_screen" : (context) => new HomeScreen(),
      "/books_detail" : (context) => new BookDetailScreen(),
      "/books_create" : (context) => new BookCreateScreen(),
      "/books_edit" : (context) => new BookEditScreen(),
      "/profile_screen" : (context) => new ProfileScreen(),
    };
  }
}