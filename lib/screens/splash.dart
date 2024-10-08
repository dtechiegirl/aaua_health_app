import 'dart:async';

import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:aauahealthapp/src/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.pushReplacementNamed(context, Routes())
    // });
    // Future.delayed(Duration(seconds:10  ));
     Timer(
        const Duration(seconds: 3),
            () =>
        //Navigator.pushReplacementNamed(context, Routes.nav)
        Navigator.pushReplacementNamed(
            context, Routes.signIn)
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.accent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
          Image(
            image: AssetImage("assets/logo.png"),
            height: 150,
          ),
          Text("AAUA HEALTH APP", style: TextStyle(color: Colors.white, fontSize: 30),)
        ])),
      ),
    ));
  }
}
