import 'package:flutter/material.dart';
import '../global.dart';
import 'Home/Home.dart';
import 'Favourites/Favourites.dart';
import 'Profile/Profile.dart';
import 'AboutUs/AboutUs.dart';

class Navbar extends StatefulWidget {
  final CredentialData data;
  Navbar({
    @required this.data,
  });


  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  void initState() {
    super.initState();
    
  }
  int _selectedIndex = 0;
  List<Widget> _widgetOptions() =>[
    Home(data: widget.data,),
    Favourites(),
    Profile(data: widget.data,),
    AboutUs(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
        final List<Widget> widgetOptions = _widgetOptions();
    return Scaffold(
      body: 
 widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromRGBO(0, 168, 150, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Favourites',
              backgroundColor: Color.fromRGBO(0, 168, 150, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Profile',
              backgroundColor: Color.fromRGBO(0, 168, 150, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'About Us',
              backgroundColor: Color.fromRGBO(0, 168, 150, 1)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}