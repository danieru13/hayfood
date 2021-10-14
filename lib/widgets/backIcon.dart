import 'package:flutter/material.dart';
import 'dart:io';

Widget backIcon(BuildContext context, color, pop){
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: color,
      size: 28.0,
    ),
    onPressed: (){
      if(pop == 1){
        Navigator.pop(context);
      }      
    },
  );
}