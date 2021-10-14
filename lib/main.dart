import 'package:flutter/material.dart';
import 'package:hayfood/constants.dart';
import 'package:hayfood/pages/initial_page.dart';
import 'package:hayfood/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,      
      title: 'Hay Food',   
      home: InitialPage(),   
      theme: generalTheme
    );
  }
}