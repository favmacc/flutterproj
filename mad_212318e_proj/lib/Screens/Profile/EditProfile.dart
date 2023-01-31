import 'package:flutter/material.dart';
import '../../global.dart';

class EditProfile extends StatefulWidget {
  final CredentialData data;
  EditProfile({
    @required this.data,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

// do something with the form data

class _EditProfileState extends State<EditProfile> {
    final _formKey = GlobalKey<FormState>();
  @override
  
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    String _email;
    String _username;
    final TextEditingController emailController =  TextEditingController();
    final TextEditingController usernameController =  TextEditingController();

  
  
    void update(BuildContext context, CredentialData data, String _email,
        String _username) {
          setState(() {
    _username = usernameController.text;
    _email=emailController.text;

});
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        print(_email);
        print(_username);
        var index =
            accounts.indexWhere((element) => element.email == data.email);
        var updateduser = new CredentialData(_email, _username, data.pwd);

        setState(() {
          accounts[index] = updateduser;
        });

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Account has been updated'),
        ));
      }
    }

    return Scaffold(
      appBar: (AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color.fromRGBO(0, 168, 150, 1),
      )),
       body: Builder(
        builder: (context) => SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, bottom),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an username';
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                RaisedButton(
                  onPressed: () {
                    update(context, widget.data, _email, _username);
                  },
                  child: Text('Update'),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}