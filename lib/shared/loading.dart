import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: SpinKitSquareCircle(
          color: Colors.lightBlueAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
