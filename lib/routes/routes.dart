import 'package:flutter/material.dart';
import 'package:hayfood/pages/home.dart';
import 'package:hayfood/pages/login.dart';
import 'package:hayfood/pages/menu.dart';
import 'package:hayfood/pages/product_detail.dart';

final routes = <String,WidgetBuilder>{
  'login': (BuildContext context) => LoginPage(),
  'home-page': (BuildContext context) => HomePage(),  
  'menu': (BuildContext context) => MenuPage(), 
  'detail': (BuildContext context)=> ProductDetail()     
};
