import 'package:flutter/material.dart';
import 'package:wiki_summary/Screens/Search.dart';
import 'Authentication/Authenticate.dart';
import 'package:provider/provider.dart';
import 'Models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user==null ? Authenticate() : SearchHome();
  }
}