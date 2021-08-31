import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hayfood/pages/home.dart';
import 'package:hayfood/pages/login.dart';
import 'package:hayfood/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginPage();
              }
            },
          ),
        ),
      );     
  }
  Widget buildLoading() => Center(child: CircularProgressIndicator());


