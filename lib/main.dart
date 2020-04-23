import 'package:flutter/material.dart';
import 'package:wiki_summary/Authentication/auth.dart';
import 'package:wiki_summary/Models/User.dart';
import 'package:wiki_summary/Wrapper.dart';
import 'Screens/Login.dart';
import 'Screens/Register.dart';
import 'Screens/Search.dart';
import 'Screens/WikiData.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: Wrapper(),
          routes: {
            '/': (context) => Wrapper(),
            '/Register': (context) => Register(),
            '/Login': (context) => Login(),
            '/Search': (context) => SearchHome(),
            '/Wiki': (context) => WikiData(),
          },
        ),
    );
  }
}
