import 'package:flutter/material.dart';
import 'package:hayfood/routes/routes.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'login',
      title: 'Hay Food',      
      theme: ThemeData(
        accentColor: Color.fromRGBO(255, 161, 45, 1.0),
        primaryColor: Color.fromRGBO(6, 0, 117, 1.0),
        buttonColor: Color.fromRGBO(48,39, 244, 1.0),
        disabledColor: Color.fromRGBO(142, 142, 147, 1.2),
        scaffoldBackgroundColor: Colors.white,        
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black)
        ),
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFF030047),
          ),
          subtitle1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0XFFB7B7D2),
          )
        )       
        
      ), 

    );
  }
}