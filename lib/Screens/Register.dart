import 'package:flutter/material.dart';
import 'package:wiki_summary/Authentication/auth.dart';
import 'package:wiki_summary/shared/Loading.dart';
import 'package:wiki_summary/shared/constants.dart';

class Register extends StatefulWidget {

 final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text('Register Here'),
        backgroundColor: Colors.blueGrey[600],
      ),
      body: Container(
      padding: EdgeInsets.all(40),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val) {
                 setState(() {
                    email = val;
                 });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 50,height: 100),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                         setState(() {
                           loading = true;
                         }); 
                         dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                            });
                            print('error signing in');
                          } else {
                            print('signed in');
                            print(result.uid);
                          }
                      },
                      ),
                  SizedBox(width: 30,),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      widget.toggleView();
                      // Navigator.pushNamed(context, '/Login');
                    }
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
