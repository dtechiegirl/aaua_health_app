import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String groupValue = "";
  bool _isSuccess = false;

  DateTime today = DateTime.now();
  final authUser = FirebaseAuth.instance.currentUser!;

  void _selected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      // print
    });
  }


  void _submit() async {
    var stoday = today.toString();
    print("$groupValue, $stoday");
    try {
      setState(() {
        _isSuccess = true;
      });
      final userUid = authUser.uid;
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .get();
      await FirebaseFirestore.instance.collection('booking').doc(userUid).set({
        'fullname': stoday,
        'groupVal': groupValue,
      });
      setState(() {
        _isSuccess = false;
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text( "Booking Completed")));
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(
                  child: Column(
                children: [
                  Text(
                    "Book Appointment",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text("Schedule your appointment with a healthcare"),
                  Text("Professional")
                ],
              )),
              SizedBox(
                height: 10,
              ),
              Text("Select Services"),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: Radio(
                        value: "General Checkup",
                         activeColor: AppColors.primaryColor,
                        groupValue: groupValue,
                        onChanged: (newValue) {
                          setState(() {
                            groupValue = newValue!;
                          });
                        }),
                  ),
                  Text("General Checkup"),
                  Radio(
                      value: "Mental Services",
                       activeColor: AppColors.primaryColor,
                      groupValue: groupValue,
                      onChanged: (newValue) {
                        setState(() {
                          groupValue = newValue!;
                        });
                      }),
                  Text("Mental Services"),
                ],
              ),

              // SizedBox(height: 20,),
              Row(
                children: [
                  Radio(
                      value: "Dental Services",
                       activeColor: AppColors.primaryColor,
                      groupValue: groupValue,
                      onChanged: (newValue) {
                        setState(() {
                          groupValue = newValue!;
                        });
                      }),
                  Text("Dental Services"),
                  Radio(
                      value: "Specialist",
                      groupValue: groupValue,
                       activeColor: AppColors.primaryColor,
                      onChanged: (newValue) {
                        setState(() {
                          groupValue = newValue!;
                        });
                      }),
                  Text("Specialist"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "Others",
                       activeColor: AppColors.primaryColor,
                      groupValue: groupValue,
                      onChanged: (newValue) {
                        setState(() {
                          groupValue = newValue!;
                        });
                      }),
                  Text("Others"),
                ],
              ),
              Container(
                width: 100,
                child: TableCalendar(
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.deepBlue),
                    todayTextStyle: TextStyle(color: Colors.black),
                    todayDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent),
                  ),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 15),
                  lastDay: DateTime(2030, 12, 30),
                  onDaySelected: _selected,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                ),
              ),
        SizedBox(height: 10,),
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
                    child: _isSuccess ? SizedBox( height: 10, child: CircularProgressIndicator(),) :  Text(
                      "Book Now!",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
