import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ReturnDex/bottombar/home_ui_bar.dart';
import 'package:ReturnDex/bottombar/profile_ui_bar.dart';
import 'package:ReturnDex/bottombar/search_ui_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedpage = 0;
  final _pageOptions = [
    HomeBar(),
    SearchBar(),
    ProfileBar(),
  ];









  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pageOptions[_selectedpage],
        bottomNavigationBar: BottomNavyBar(
          currentIndex: _selectedpage,
          onItemSelected: (int index) => setState(() {
                _selectedpage = index;
                // print(index);

                // _controller.animateTo(_index);
              }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.search),
                title: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                activeColor: Colors.red),
            BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(
                'You',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              activeColor: Colors.red,
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade200,
      
      ),
      
    );
  }
}
