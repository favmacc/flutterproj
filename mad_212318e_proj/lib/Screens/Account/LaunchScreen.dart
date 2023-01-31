import 'package:flutter/material.dart';
import 'Register.dart';
import 'Login.dart';

class LaunchScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        children: [
          SizedBox(height: 160),
          Container(
            width: 140,
            height: 140,
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 60),
          ButtonTheme(
            minWidth: 200,
            height: 50,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
            child: RaisedButton(
                color: Color.fromRGBO(5, 102, 141, 1),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text('Register')),
          ),
          SizedBox(height: 20),
          ButtonTheme(
            minWidth: 200,
            height: 50,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0),
            ),
            child: RaisedButton(
                color: Color.fromRGBO(5, 102, 141, 1),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('Login')),
          )
        ],
      ),
    );
  }
}
