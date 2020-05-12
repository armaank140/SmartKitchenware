import 'package:flutter/material.dart';
import 'package:smart_kitchenware/screen/authenticate/authenticate.dart';
import 'package:smart_kitchenware/screen/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either Home or Authentication Widget
    return Home();

  }
}
