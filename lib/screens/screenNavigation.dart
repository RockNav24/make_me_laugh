import 'package:flutter/material.dart';
import 'package:make_me_laugh/screens/homeScreen.dart';
import 'package:make_me_laugh/screens/searchScreen.dart';

class ScreenNavigation extends StatefulWidget {
  static const String SCREEN_NAME = 'ScreenNavigation';

  ScreenNavigation({Key key}) : super(key: key);

  @override
  _ScreenNavigationState createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  int _selectedIndex = 0;
  List<Widget> _screens = <Widget>[
    HomeScreen(),
    SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOL'),
        backgroundColor: Color(0xfffcba04),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xfff2b202),
      ),
      body: SafeArea(
        child: _screens.elementAt(_selectedIndex),
      ),
    );
  }
}
