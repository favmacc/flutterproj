import 'package:flutter/material.dart';
import '../Home/Home.dart';
import '../Navbar.dart';
import '../../global.dart';

class Register extends StatefulWidget {
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email;
  String _username;
  String _password;
  String _retypepassword;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final retypepasswordController = TextEditingController();
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    retypepasswordController.dispose();
    passwordController.dispose();
    super.dispose();

  }
  void submit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      for (var account in accounts) {
        if (_email == account.email) {
          emailController.clear();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Email is already taken try again'),
          ));
          return;
        } else if (_username == account.user) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('User is already taken try again'),
          ));
          return;
        } else if (_password != _retypepassword) {
          passwordController.clear();
          retypepasswordController.clear();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Retype password again its not the same'),
          ));
          return;
        }
        var newuser =CredentialData(_email, _username, _password);
  accounts.add(newuser);

        var index = accounts.indexOf(newuser);
     


   Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Navbar(data: accounts[index]))); 
      }
      // do something with the form data
      emailController.clear();
      passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Color.fromRGBO(0, 168, 150, 1),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, bottom),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 70),
                        Center(
                          child: Container(
                            child: Image.asset(
                              'images/logo.png',
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
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
                        SizedBox(height: 20),
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(labelText: 'Username'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                          onSaved: (value) => _username = value,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a Password';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          controller: retypepasswordController,
                          decoration:
                              InputDecoration(labelText: 'RetypePassword'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a RetypePassword';
                            }
                            return null;
                          },
                          onSaved: (value) => _retypepassword = value,
                        ),
                        SizedBox(height: 30),
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
                              submit(context);
                            },
                            child: Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
