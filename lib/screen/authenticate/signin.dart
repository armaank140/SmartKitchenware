import 'package:flutter/material.dart';
import 'package:smart_kitchenware/services/auth.dart';
import 'package:smart_kitchenware/shared/constants.dart';
import 'package:smart_kitchenware/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  String email = '';
  String password = '';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,
              color: Colors.black,
            ),
            label:Text('Register',
            ),
            onPressed: (){
              widget.toggleView();

            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Email',
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
                    hintText: 'Password',
                  //  prefixStyle: ,
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
                    'Sign In',
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
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null){
                        setState((){
                          error = 'COULD NOT SIGN IN WITH THOSE CEDENTIALS ';
                          loading = false;
                        } );
                      }
                    }
                  },
                ),
                SizedBox(height: 20.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              SizedBox(height: 5.0,),
               _buildSignInWithText(),
                _buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget _buildSignInWithText() {
  return Column(
    children: <Widget>[
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        'Sign in with',
        style: kLabelStyle,
      ),
    ],
  );
}

//Social Media Log Wedget
Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}

Widget _buildSocialBtnRow() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildSocialBtn(
              () => print('Login with Facebook'),
          AssetImage(
            'assets/logos/facebook.jpg',
          ),
        ),
        _buildSocialBtn(
              () => print('Login with Google'),
          AssetImage(
            'assets/logos/google.jpg',
          ),
        ),
      ],
    ),
  );
}

