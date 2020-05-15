import 'package:flutter/material.dart';
import 'package:smart_kitchenware/services/auth.dart';
import 'package:smart_kitchenware/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: (){
               _auth.Signout();
            },
          )
        ],
      )
    );
  }
}
