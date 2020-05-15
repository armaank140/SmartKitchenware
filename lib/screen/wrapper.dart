import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_kitchenware/screen/authenticate/authenticate.dart';
import 'package:smart_kitchenware/screen/home/home.dart';
import 'package:smart_kitchenware/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    //return either Home or Authentication Widget
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }

  }
}
