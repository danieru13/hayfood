import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hayfood/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

Widget signOutWidget(BuildContext context){
  final user = FirebaseAuth.instance.currentUser;
  return Row(children: [    
    PopupMenuButton<int>(      
      child: CircleAvatar(
        maxRadius: 20,
        backgroundImage: NetworkImage(user!.photoURL.toString()),
      ),
      itemBuilder: (context)=>[
        PopupMenuItem<int>(
          child: Text("Cerrar sesión"),          
          value: 0,
        )
      ],
      onSelected: (item)=>onLogOut(context,item),
    )    
  ],);
}
void onLogOut(BuildContext context, int item){
  switch(item){
    case 0:        
      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
      provider.logout();      
  }    
}