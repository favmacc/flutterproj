import 'package:flutter/material.dart';
import 'Screens/Account/LaunchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie Reviews',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Foodie Reviews'),
          backgroundColor: Color.fromRGBO(0, 168, 150, 1),
        ),
        body: LaunchScreen(),
      ),
    );
  }
}
