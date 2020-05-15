import 'package:flutter/material.dart';
import 'package:smart_kitchenware/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();


  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label:Text('Register'),
            onPressed: (){
              widget.toggleView();

            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val){
                  setState(() => email = val);

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(()  => password = val);

                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.white,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async{
                print(email);
                print(password);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
