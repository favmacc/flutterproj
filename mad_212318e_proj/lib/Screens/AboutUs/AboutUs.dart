import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'FeedbackForm.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: (AppBar(
          title: Text('About Us'),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(0, 168, 150, 1))),
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(50, 0, 50, bottom),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 45),
                Text(
                  'About Us',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  child: Image.asset(
                    'images/logo.png',
                    height: 100,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Application Info',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(5, 102, 141, 1)),
                ),
                SizedBox(height: 15),
                Text(
                  'food review app for foodies across singapore',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 15),
                Text(
                  'Company Info',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(5, 102, 141, 1)),
                ),
                SizedBox(height: 15),
                Text(
                  'Established in @2023 located in Geylang',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 15),
                Text(
                  'Contact No',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(5, 102, 141, 1)),
                ),
                TextButton(
                    onPressed: () async {
                      var url = "tel:+6590369321";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text('+65 90369321')),
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(5, 102, 141, 1)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedbackForm()));
                    },
                    child: Text('favianmak04@gmail.com')),
                Text(
                  'Developer Info',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(5, 102, 141, 1)),
                ),
                SizedBox(height: 15),
                Text(
                  'Favian Mak',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          )),
    );
  }
}
