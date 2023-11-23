// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../color.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, right: 0),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: ungu,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Center(child: Icon(Icons.arrow_back)),
        ),
      ),
    );
  }
}
