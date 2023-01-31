import 'package:flutter/material.dart';
import '../../global.dart';
import 'EditProfile.dart';
class Profile extends StatefulWidget {
  final CredentialData data;
  Profile({
    @required this.data,
  });
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: Text('Profile'),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(0, 168, 150, 1),
        )),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('username'),
                Text(widget.data.user),
                Text('email'),
                Text(widget.data.email),

                RaisedButton(onPressed:(){Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context) =>
                                             EditProfile(data:widget.data)));},child: Text('Edit'),)
                
              ],
            ),
          ),
        ));
  }
}
