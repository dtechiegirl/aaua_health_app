import 'package:aauahealthapp/auth/widgets/formfieldswidget.dart';
import 'package:aauahealthapp/screens/dashboard.dart';
import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final authUser = FirebaseAuth.instance.currentUser!;
  var fullName = "";
  var dobVal = "";
  var matNum = "";
  var contactName = "";
  var status = "";
  var phoneNo = "";
  bool _isSuccess = false;

  String groupValue = "";
  String groupValue1 = "";
  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    _formKey.currentState!.reset();

    print(
        ' the value is $fullName, $dobVal, $matNum, $contactName, $status, $phoneNo, $groupValue, $groupValue1');

    try {
      setState(() {
        _isSuccess = true;
      });
      final userUid = authUser.uid;
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .get();
      await FirebaseFirestore.instance.collection('register').doc(userUid).set({
        'fullname': fullName,
        'matricNum': userData.data()!["studentId"],
        'dob': dobVal,
        'contactName': contactName,
        'phoneNo': phoneNo,
        'status': status,
        'groupVal': groupValue,
        'groupVal1': groupValue1,
        'uid' : userUid
      });
      setState(() {
        _isSuccess = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registration Completed")));
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? "Authentication Failed")));
      // }

      // setState(() {
      //   isSending = false;
      //   // _formKey.currentState!.reset();
      // });
      setState(() {
        _isSuccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget text = ListView(children: [
      const Text(
        "Health Centre Registration",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "Register for AAUA Health Service",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Enter Your Fullname'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.deepRed, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.deepRed, width: 1.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: AppColors.borderColor, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1.5),
                    )),
                validator: (value) {
                  // return 'demo';
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 ans 50 character";
                  }
                  return null;
                },
                onSaved: (value) {
                  fullName = value!;
                  // print("value from below $yourName, $value");
                },
              ),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Enter Your Matric Number'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.deepRed, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: AppColors.borderColor, width: 1.5)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.deepRed, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1.5),
                    )),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // return 'demo';
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 1 ||
                      value.trim().length > 50 ||
                      int.tryParse(value) == null ||
                      int.tryParse(value)! <= 0) {
                    return "Must be between 1 ans 50 character";
                  }
                  return null;
                },
                onSaved: (value) {
                  matNum = value!;
                  // print("value from below $yourName, $value");
                },
              ),

              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Enter Your Date of Birth'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.deepRed, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.borderColor, width: 1.5)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.deepRed, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1.5),
                    )),
                validator: (value) {
                  // return 'demo';
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 ans 50 character";
                  }
                  return null;
                },
                onSaved: (value) {
                  dobVal = value!;
                  // print("value from below $yourName, $value");
                },

                // controller: dobController,
              ),
              Row(
                children: [
                  const Text("Gender:"),
                  const SizedBox(
                    width: 30,
                  ),
                  Radio(
                      value: "Male",
                      groupValue: groupValue,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                        // }
                      }),
                  const Text("Male"),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: "Female",
                      groupValue: groupValue,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                        // }
                      }),
                  const Text("Female"),
                ],
              ),
              const Text(
                "Do you have any pre-existing conditions?",
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Radio(
                      value: "Yes",
                      activeColor: AppColors.primaryColor,
                      groupValue: groupValue1,
                      onChanged: (value) {
                        setState(() {
                          groupValue1 = value!;
                        });
                        // }
                      }),
                  const Text("Yes"),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Radio(
                        value: "No",
                        activeColor: AppColors.primaryColor,
                        groupValue: groupValue1,
                        onChanged: (value) {
                          setState(() {
                            groupValue1 = value!;
                          });
                          // }
                        }),
                  ),
                  const Text("No")
                ],
              ),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Enter Your Contact Name'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.deepRed, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: AppColors.borderColor, width: 1.5)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.deepRed, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1.5),
                    )),
                validator: (value) {
                  // return 'demo';
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 ans 50 character";
                  }
                  return null;
                },
                onSaved: (value) {
                  contactName = value!;
                  // print("value from below $yourName, $value");
                },
                // controller: contactController,
              ),

              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Emergency Contact Number'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.deepRed, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: AppColors.borderColor, width: 1.5)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.deepRed, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1.5),
                    )),
                validator: (value) {
                  // return 'demo';
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 ans 50 character";
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNo = value!;
                  // print("value from below $yourName, $value");
                },
                // controller: numberController,
              ),

              // controller: numberController,

              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Relationship e.g Father,Mother, Sibling'),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.deepRed, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: AppColors.borderColor, width: 1.5)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.deepRed, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1.5),
                    )),
                validator: (value) {
                  // return 'demo';
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 ans 50 character";
                  }
                  return null;
                },
                onSaved: (value) {
                  status = value!;
                  // print("value from below $yourName, $value");
                },
              ),

              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.deepBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onPressed: () {
                      _submit();
                    },
                    child: _isSuccess
                        ? SizedBox(
                            height: 10,
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            "Complete Registration!",
                            style: TextStyle(color: Colors.white),
                          )),
              ),
            ],
          )),
    ]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 25,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(padding: const EdgeInsets.all(20.0), child: text),

        

      ),
    );
    //  final authUser = FirebaseAuth.instance.currentUser!;
    // final userUid = authUser.uid;
    //  return StreamBuilder(stream: FirebaseFirestore.instance.collection('register').where('uid',
    // isEqualTo: userUid).snapshots(), builder: (ctx, detailsSnapshot){
    //    if (detailsSnapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //         // if(detailsSnapshot.)
    //         print(" the snapshot us $detailsSnapshot");
    //         if (!detailsSnapshot.hasData) {
    //         return  text;
    //       }
    //         if (detailsSnapshot.hasError) {
    //         return const Center(
    //           child: Text("Something went wrong"),
    //         );
    //       }
    //       final details = detailsSnapshot.data!.docs;
    //       print('the details are $details');
    //       // return Text("");
    //        return Center(child: Text(" Your details have been recorded!"));

    // });
  }
}
