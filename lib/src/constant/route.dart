import 'package:aauahealthapp/auth/signup.dart';
import 'package:aauahealthapp/screens/appointment.dart';
import 'package:aauahealthapp/screens/dashboard.dart';
import 'package:aauahealthapp/screens/profile.dart';
import 'package:aauahealthapp/screens/register.dart';
import 'package:aauahealthapp/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Routes{
  //screens
  static const splash = '/';
  static const register = '/register';
  static const booking = '/booking';
   static const profile = '/profile';
  static const signIn = 'signIn';
  static const dashboard = '/dashboard';



  //routes
  static final routes = <String, Widget Function(BuildContext)>{
    // splash : (context) =>  const SplashScreen(),
    splash : (context) =>  const SplashScreen(),
    register : (context) =>  const RegisterScreen(),
    profile: (context) =>  ProfileScreen(),
    booking : (context) => const AppointmentScreen(),
    dashboard: (context) => const Dashboard(),
   
    signIn : (context) =>  StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges() ,
      builder: (context, snapshot) {
        if(snapshot.hasData == true){
          // final User? user = snapshot.data;
          return Dashboard();
        }else{
           return const SignupScreen();
        }
       
      }
    ),
    // dashboard : (context) =>  const DashBoard(),
  };
}
  //screens
 