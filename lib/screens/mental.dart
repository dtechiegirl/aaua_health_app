import 'package:aauahealthapp/screens/appointment.dart';
import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:flutter/material.dart';

class MentalScreen extends StatelessWidget {
  const MentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Your mental health is our piority, book a session now"),
            
            
            
            ),
             Center(
                  child: ElevatedButton.icon(
                 onPressed: () =>  Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>AppointmentScreen(),
                ),
                 ),
                label: Text("Book Now", style: TextStyle(color: Colors.white),),
                icon: Icon(Icons.bookmark_outline_rounded, color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
          ),
                ),
              ))
          ],
        ),
      ),
    );
  }
}