import 'package:flutter/material.dart';

Widget backIcon(BuildContext context){
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: Colors.black,
      size: 28.0,
    ),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}