
import 'package:flutter/material.dart';
import 'package:wiki_summary/Screens/Login.dart';
import 'package:wiki_summary/Screens/Register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
 
}

class _AuthenticateState extends State<Authenticate> {

   bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Register(toggleView:  toggleView);
    } else {
      return Login(toggleView:  toggleView);
    }
  }
}