import 'package:flutter/material.dart';
import 'package:smart_kitchenware/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label:Text('Sign In'),
            onPressed: (){
              widget.toggleView();

            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Ente an Email' : null,
                onChanged: (val){
                  setState(() => email = val);

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.length <8 ? 'Ente a password 8+ char long' : null,
                obscureText: true,
                onChanged: (val){
                  setState(()  => password = val);

                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.white,
                child: Text(
                  'Rigester',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                   dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                   if(result == null){
                     setState(() => error = 'Please Supply a Valid Email');
                   }
                  }
                },
              ),
              SizedBox(height: 20.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
