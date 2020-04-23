import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:wiki_summary/Authentication/auth.dart';

class SearchHome extends StatefulWidget {
  @override
  _SearchHomeState createState() => _SearchHomeState();
}
  
class _SearchHomeState extends State<SearchHome> {
  
  String keyword,url;
  Map data = {};
  AuthService _auth = AuthService();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('WikiPedia'),
      backgroundColor: Colors.teal[300],
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: <Widget>[
        FlatButton.icon(onPressed: () async {
          await _auth.signOut();
        }, icon: Icon(Icons.people), label: Text('SignOut'),),
      ],
    ),
    body: Container(
      child: Row(
        children: <Widget>[
        Expanded(
            flex: 1,
            child: TextField(
            style: TextStyle(
            fontSize: 21,
              ),
          decoration: InputDecoration(
            hintText: 'Search Wiki here',
              ),
              onChanged: (val) {
                keyword = val; 
              },
          ),
        ),
        FloatingActionButton(
          onPressed: () async {
          url = keyword;
          try{
          Response response = await get('https://en.wikipedia.org/api/rest_v1/page/summary/$url');
          data = convert.jsonDecode(response.body);
          } catch(e){
            print(e);
          }
          Navigator.pushNamed(context, '/Wiki', arguments: {
            'text': data['extract'] ,
            }
          );
        },
        heroTag: 'SearchBar',
        child: Icon(Icons.search),
        ),
      ],
      ),
    ),
    );
  }
}