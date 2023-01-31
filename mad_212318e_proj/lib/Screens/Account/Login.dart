import 'package:flutter/material.dart';
import '../Navbar.dart';
import '../../global.dart';

class Login extends StatefulWidget {
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromRGBO(0, 168, 150, 1),
      ),
      body:Builder(
        builder: (context) => 
      SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
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
                        'Login',
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
                        controller: passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value,
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
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              for (var account in accounts) {
                                if (_email == account.email &&
                                    _password == account.pwd) {
                                    var index = accounts.indexWhere((element) => element.email==_email);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Navbar(data:accounts[index])));
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Sign in failed'),
                                  ));
                                }
                              }
                              // do something with the form data
                              emailController.clear();
                              passwordController.clear();
                            }
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
