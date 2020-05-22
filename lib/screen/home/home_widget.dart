import 'package:flutter/material.dart';
import 'file:///C:/Users/USER/AndroidStudioProjects/smart_kitchenware/lib/screen/home/view/home_view.dart';
import 'file:///C:/Users/USER/AndroidStudioProjects/smart_kitchenware/lib/screen/home/view/profile_view.dart';
import 'file:///C:/Users/USER/AndroidStudioProjects/smart_kitchenware/lib/screen/home/view/shop_view.dart';
import 'home.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ProfileView(),
    HomeView(),
    ShopView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
         currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_pin),
              title: new Text("profile"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart),
              title: new Text("Shop"),
            ),
          ]
      ),


    );
  }
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

}

