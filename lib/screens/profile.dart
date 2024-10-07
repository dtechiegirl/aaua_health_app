import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 final firebase = FirebaseAuth.instance;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          firebase.signOut();
        }, icon: Icon(Icons.logout))],
      ),
  body: Center(child: Text("Visit Ictac to retrieve your details, thank you!"),),
    );
  }
}