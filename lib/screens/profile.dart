import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseAuth.instance;

class ProfileScreen extends StatelessWidget {
  // AuthService authService = AuthService();
  final authUser = FirebaseAuth.instance.currentUser!;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  firebase.signOut();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Text(
              "These are your registered details",
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("register")
                    .where("uid", isEqualTo: authUser.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  print(authUser.uid);
                  if (snapshot.hasData) {
                    // var data = snapshot.data!.docs;
                    // print(" the length is ${data.length}");
                    // return Column(
                    //   children: [
                    //     Text(data.toString()),
                    //     Text(data[0]['fullname'])
                    //   ],
                    // );
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            var data = snapshot.data!.docs[i];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: AppColors.accent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'FULLNAME: ${data['groupVal']}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            'Contact Name: ${data['contactName']}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Gender: ${data['groupVal']}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            'DOB: ${data['dob']}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Matric No: ${data['matricNum']}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            'Phone No: ${data['phoneNo']}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.data == null || !snapshot.hasData) {
                    return Center(child: Text("Please register "));
                  } else {
                    return Text("No data found");
                  }
                }),
            Text(
              "These are your booking details",
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("booking")
                    .where("uid", isEqualTo: authUser.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> bookingsnap) {
                  print('these are the d ${authUser.uid}');
                  if (bookingsnap.hasData) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: bookingsnap.data!.docs.length,
                            itemBuilder: (context, i) {
                              var data = bookingsnap.data!.docs[i];
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: AppColors.accent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Booking: ${data['booking']}',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          'Services: ${data['groupVal']}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));
                  } else if (bookingsnap.data == null || !bookingsnap.hasData) {
                    return Center(child: Text("Please book an appointment "));
                  }
                  // var data = snapshot.data!.docs;
                  // print(" the length is ${data.length}");
                  // return Column(
                  //   children: [
                  //     Text(data.toString()),
                  //     Text(data[0]['fullname'])
                  //   ],
                  return Text("No data found");
                })
          ],
        ));
  }
}
