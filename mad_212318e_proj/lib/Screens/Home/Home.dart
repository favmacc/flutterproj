import 'package:flutter/material.dart';
import '../../global.dart';


class Home extends StatefulWidget {
  final CredentialData data;
  Home({
    @required this.data,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print(accounts[0].pwd);
    return Scaffold(
      appBar: (AppBar(
          title: Text('Home'),
          backgroundColor: Color.fromRGBO(0, 168, 150, 1),)),
      body: SingleChildScrollView(
        child: Column(
          children: [/* Text(widget.data.email),Text(widget.data.user),Text(widget.data.pwd) */],
          
        ),
      ),
    );
  }
}
