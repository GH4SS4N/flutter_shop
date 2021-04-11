import 'package:flutter/material.dart';

class StartUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          transform: Matrix4.translationValues(100, 100, 1),
        )
      ],

    );


  }
}
