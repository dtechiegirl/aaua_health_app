import 'package:aauahealthapp/auth/widgets/formfieldswidget.dart';
import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
                "Welcome to AAUA Health App, Create\n account and Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
          ),
                SizedBox(height: 20,),
                 
                    SizedBox(height: 20,),
                formFieldWidget(obscureText: false, hintText: "Enter Student ID",),
                SizedBox(height: 20,),
                formFieldWidget(obscureText: true, hintText: "Enter Password",),
                  SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
                
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Login", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20), ),
              ),
              width: 50,
              height: 50,
            ),
      
        ],
      ),
    ),));
  }
}