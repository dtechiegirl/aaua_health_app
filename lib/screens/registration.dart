import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser!;
    final userUid = authUser.uid;
    print("the uid is $userUid");
    return StreamBuilder(stream: FirebaseFirestore.instance.collection('register').where('uid', 
    isEqualTo: userUid).snapshots(), builder: (ctx, detailsSnapshot){
       if (detailsSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
            if (!detailsSnapshot.hasData) {
            return const Center(
              child: Text("No messages found"),
            );
          }
            if (detailsSnapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          final details = detailsSnapshot.data!.docs;
          print('the details are $details');
          // return Text("");
           return Text("");

    });
  }
}