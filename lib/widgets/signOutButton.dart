import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hayfood/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

Widget signOutWidget(BuildContext context){
  final user = FirebaseAuth.instance.currentUser;
  return Row(children: [
    CircleAvatar(
      maxRadius: 20,
      backgroundImage: NetworkImage(user!.photoURL.toString()),
    ),
    ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
  ],);
}