import 'package:aauahealthapp/screens/widgets/homepagetips.dart';
import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   final User? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //    final authUser = FirebaseAuth.instance.currentUser!;
  //   late String studentId;
  //   late String uid;
  //    @override
  //    void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

  // void getData() async{
  //   User user =  FirebaseAuth.instance.currentUser!;
  //   // uid = user.uid;
  //  final DocumentSnapshot userdoc =  await FirebaseFirestore.instance.collection("users").doc(uid).get();
  //   studentId = userdoc.get('studentId');
  // }
     
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              CircleAvatar(
                child: Image.asset("assets/profile.png"),
              ),
              SizedBox(
                width: 5,
              ),
              Text("Hi,\there")
              // authUser.
            ],
          ),
          leadingWidth: 120,
          actions: [
            Icon(Icons.notifications_none),
            Image.asset(
              "assets/hamburger.png",
              height: 15,
            )
          ],
          // title: Text("Hello, Thorg"),
        ),
        body: ListView(
          children: [
            Row(
              children: [
                HomePageTipsWidget(
                  text: 'Health Tips',
                  image: Image.asset(
                    "assets/tips.png",
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                HomePageTipsWidget(
                  text: 'Safety Tips',
                  image: Image.asset(
                    "assets/safety.png",
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                HomePageTipsWidget(
                  text: 'Stress Management',
                  image: Image.asset(
                    "assets/huawei.png",
                    height: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "Your Health, Now in good Hands",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              // width: 50,
              constraints: BoxConstraints(maxWidth: 300),
              decoration: BoxDecoration(
                  color: AppColors.deepBlue,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "How are you feeling today?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MoodWidget(
                        text: 'Worried',
                        image: Image.asset(
                          "assets/worried.png",
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MoodWidget(
                        text: 'Happy',
                        image: Image.asset(
                          "assets/happy.png",
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MoodWidget(
                        text: 'Excited',
                        image: Image.asset(
                          "assets/cool.png",
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MoodWidget(
                        text: 'Angry',
                        image: Image.asset(
                          "assets/angry.png",
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MoodWidget(
                        text: 'Tired',
                        image: Image.asset(
                          "assets/tired.png",
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Services",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: (1 / .6),
              physics: NeverScrollableScrollPhysics(),
              children: [
                GridItemWidget(
                  text: 'Register for Health\nServices',
                  image: Image.asset(
                    "assets/reg.png",
                    height: 20,
                  ),
                ),
                GridItemWidget(
                  text: 'Book Appointment',
                  image: Image.asset(
                    "assets/appoint.png",
                    height: 25,
                  ),
                ),
                GridItemWidget(
                  text: 'Counselling',
                  image: Image.asset(
                    "assets/chat.png",
                    height: 25,
                  ),
                ),
                GridItemWidget(
                  text: 'Emergency Report',
                  image: Image.asset(
                    "assets/outline.png",
                    height: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // SizedBox(
            //   width: 20,
            //   ch
            // )
            Center(
                child: ElevatedButton.icon(
              onPressed: () {},
              label: Text("Emergency Contact", style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.call, color: Colors.white,),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepRed,
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
  ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    super.key,
    required this.image,
    required this.text,
    this.subtext,
  });
  final Image image;
  final String text;
  final String? subtext;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 20),
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          Text(
            text,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

class MoodWidget extends StatelessWidget {
  const MoodWidget({
    super.key,
    required this.image,
    required this.text,
  });
  final Image image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image,
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
