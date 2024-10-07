import 'package:aauahealthapp/auth/widgets/formfieldswidget.dart';
import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:aauahealthapp/validate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpassController = TextEditingController();
  void clearText() {
    studentIDController.clear();
    emailController.clear();
    passwordController.clear();
    //  cpassController.clear();
  }

  @override
  void dispose() {
    studentIDController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cpassController.dispose();
    super.dispose();
  }

  var _isLogin = true;
  bool? _checkbox = false;
  var _studentID = "";
// var userna = "";
  var _password = "";
  var _email = "";
  // var _confirmPassword = "";
  // var _agreeToTerms = "";
  bool isSending = false;
  late bool? _selectedValue;

// bool selectedItem;
  void _submit() async {
    final _isValid = _formKey.currentState!.validate();
    if (!_isValid) {
      return;
    }
    _formKey.currentState!.save();

    String _email = emailController.text;
    String _studentID = studentIDController.text;
    String _password = passwordController.text;
    try {
      setState(() {
        isSending = true;
      });
      if (_isLogin) {
        QuerySnapshot snap = await FirebaseFirestore.instance
            .collection("users")
            .where("studentId", isEqualTo: _studentID)
            .get();
        // final cof = snap.docs[0]['email'];
        // print('the  cof is $cof');
        // else{
        final String firebaseMail = snap.docs[0]['email'];

        final signIn = await _firebase.signInWithEmailAndPassword(
            email: firebaseMail, password: _password);
        // }
      } else {
        final UserCredential = await _firebase.createUserWithEmailAndPassword(
            email: _email, password: _password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(UserCredential.user!.uid)
            .set({
          'studentId': _studentID,
          'email': _email,
          // 'agreeToTerms': agreeToTerms
        });
      }
      // var agreeToTerms = _selectedValue.toString();
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? "Authentication Failed")));
      // }

      setState(() {
        isSending = false;
        // _formKey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Welcome to AAUA Health App, Create\n account and Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // if (_isLogin)
                  formFieldWidget(
                    hintText: "Enter Student ID",
                    obscureText: false,
                    controller: studentIDController,
                    
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 4) {
                        return "Please enter a valid STUDENT-ID";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                       _studentID = newValue!;
                      // print(_studentID);

                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (!_isLogin)
                    formFieldWidget(
                      hintText: "Enter Email Address",
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                      controller: emailController,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            validateEmailAddress(value) == false) {
                          // print('the email is $value');
                          return "Enter a valid Email Address";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _email = newValue!;
                        // print(_email);
                      },
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  formFieldWidget(
                    hintText: "Enter Password",
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      // print('the value is $value');
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 6) {
                        // print('the no is $value');
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _password = newValue!;
                      // print(_password);
                      // return "null";
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (!_isLogin)
                    formFieldWidget(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: cpassController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 6 ||
                            passwordController.text != cpassController.text) {
                          // print('the val is $value');
                          return "Password does not match";
                        }
                        return null;
                      },
                      // onSaved: (newValue),
                    ),
                  if (!_isLogin)
                    CheckboxListTile(
                      value: _checkbox,

                      onChanged: (bool? newValue) {
                        setState(() {
                          _checkbox = newValue;
                          _selectedValue = newValue;
                          // print(_selectedValue);
                        });
                      },
                      // subtitle: !_checkbox!
                      //     ? Text(
                      //         'Required.',
                      //         style: TextStyle(color: Colors.red),
                      //       )
                      //     : null,
                      title: const Text("I agree to the terms and conditions"),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.accent,
                      // tristate: true,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  const SizedBox(
                    height: 50,
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
                        child: isSending
                            ? const SizedBox(
                                height: 50, child: CircularProgressIndicator())
                            : Text(
                                _isLogin
                                    ? "Login"
                                    : "Let's get you registered!",
                                style: TextStyle(color: Colors.white),
                              )),
                  ),

                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                        _isLogin
                            ? "Don't have an account? Signup"
                            : "Aleady have an account? Login",
                        style: const TextStyle(color: AppColors.deepBlue),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
