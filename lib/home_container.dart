import 'package:flutter/material.dart';
import 'package:james_childrens_app/book_grid_screen.dart';
import 'package:james_childrens_app/new_book_form.dart';
import 'package:james_childrens_app/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomeScreen>{
  final PageController controller = new PageController();
  int _selectedIndex = 0;

  BottomNavigationBar _buildFooter(){ 
      return new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            controller.animateToPage(
              _selectedIndex,
              duration: kTabScrollDuration,
              curve: Curves.fastOutSlowIn,
            );
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            title: new Text('Book'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
        ],
      );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new PageView(
        controller: controller,
        onPageChanged: (index) => setState(() => _selectedIndex = index),
        children: <Widget>[
          new BookGridScreen(),
          new BookCreateScreen(),
          new ProfileScreen()
        ],
      ),
      bottomNavigationBar: _buildFooter(), 
    );
  }
}
