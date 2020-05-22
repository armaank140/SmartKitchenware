import 'package:flutter/material.dart';
import 'package:smart_kitchenware/services/auth.dart';
import 'package:smart_kitchenware/shared/constants.dart';
import 'package:smart_kitchenware/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String name = '';
  String number = '';
  String password = '';
  String error ='';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
               /* SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your Name',
                    prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  ),
                  validator: (val) => val.isEmpty ? 'Ente a Name' : null,
                  onChanged: (val){
                    setState(() => name = val);

                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your Phone no',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Ente a Phone Number' : null,
                  onChanged: (val){
                    setState(() => number = val);

                  },
                ),*/
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter yor Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  validator: (val) => val.isEmpty ? 'Ente an Email' : null,
                  onChanged: (val){
                    setState(() => email = val);

                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                  validator: (val) => val.length <8 ? 'Ente a password 8+ char long' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(()  => password = val);

                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  elevation: 5.0,
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Text(
                    'Rigester',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                   // style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                     dynamic result = await _auth.registerWithEmailAndPassword(name, number, email, password);
                     if(result == null){
                       setState((){
                        error = 'Please Supply a Valid Email';
                        loading = false;
                       });
                     }
                    }
                  },
                ),
                SizedBox(height: 20.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
