import 'package:flutter/material.dart';
import 'package:wiki_summary/Authentication/auth.dart';
import 'package:wiki_summary/shared/Loading.dart';
import 'package:wiki_summary/shared/constants.dart';

class Login extends StatefulWidget {

 final Function toggleView;
  Login({ this.toggleView });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  String username = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      appBar: AppBar(
        title: Text(' Login '),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? 'Enter an valid email' : null,
                  style: TextStyle(
                    fontSize: 21,
                  ),
                  decoration: textInputDecoration.copyWith(hintText: 'UserName'),
                  onChanged: (val) {
                    username = val;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.length < 6
                      ? 'Enter a password atleast 6+ chars long'
                      : null,
                  style: TextStyle(
                    fontSize: 21,
                    
                  ),
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  onChanged: (val) {
                    
                    password = val;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Row(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Register'),
                        onPressed: () async {
                          setState(() {
                              loading = false;
                            });
                          widget.toggleView();
                        },
                      ),
                      SizedBox(width: 30),
                      RaisedButton(
                        child: Text('Login'),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true );
                            dynamic result = await _auth.signInEmailPassword(username, password); 
                            if (result == null) {
                              setState(() => loading = true );
                              print('error signing in');
                            } else {
                              print('signed in');
                              print(result.uid);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
