import 'package:aauahealthapp/screens/register.dart';
// import 'package:aauahealthapp/screens/ll.dart';
import 'package:aauahealthapp/screens/appointment.dart';
import 'package:aauahealthapp/screens/home.dart';
import 'package:aauahealthapp/screens/mental.dart';
import 'package:aauahealthapp/screens/profile.dart';
import 'package:aauahealthapp/screens/registration.dart';
import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:aauahealthapp/src/constant/icons.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    AppointmentScreen(),
    
    RegisterScreen(),
    // MentalScreen(),
    MentalScreen(),
    ProfileScreen()
    // 
  ];
   void onTapTabbed(int index){
    setState(() {
      _currentIndex = index;
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        onTap: onTapTabbed,
        currentIndex: _currentIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home" ),
        BottomNavigationBarItem(icon: Icon(MyFlutterApp.material_symbols_light_edit_calendar_outline), label: "Book" ),
        BottomNavigationBarItem(icon: Icon(Icons.folder_open), label: "Record" ),
         BottomNavigationBarItem(icon: Icon(MyFlutterApp.mdi_head_heart_outline), label: "Mental" ),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile" ),
      ],),
    );
  }
}