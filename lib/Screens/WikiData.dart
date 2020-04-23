import 'package:flutter/material.dart';

class WikiData extends StatelessWidget {
  Map data ={};
  @override
  Widget build(BuildContext context) {

  data = ModalRoute.of(context).settings.arguments;
  String res = data['text']!=null ? data['text'] : 'Error Not Found';

    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Search Result'),
            backgroundColor: Colors.orangeAccent[300],
          ),
          body: Card(
            child: SafeArea(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( res,
              style: TextStyle(
                wordSpacing: 5,
                fontSize: 18,
              ),
             ),
            ),
          ),
      ),
    );
  }
}