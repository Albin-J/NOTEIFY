// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_import, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noteify2/pages/login.dart';
import 'package:noteify2/pages/micai.dart';
import 'package:noteify2/pages/note.dart';
//import 'package:noteify2/pages/playfor.dart';
import 'package:noteify2/pages/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    HomeScreen(),
    SpeechScreen(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Container(
                //color: Colors.orange,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        signout(context);
                      },
                      icon: const Icon(
                        Icons.circle_rounded,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 2,
                    // ),
                    const Flexible(
                      child: Column(
                        children: [
                          SizedBox(
                            child: Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text('User'),
                        ],
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.notifications,
                    //     size: 30,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  fillColor: Colors.white,
                  hintText: 'Search....',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              //color: Colors.white,
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            // Container(
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(30.0),
            //         child: Column(
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(15),
            //                 color: Color.fromARGB(255, 243, 218, 145),
            //               ),
            //               height: 75,
            //               width: double.infinity,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text('        DD/MM/YYYY HR:MS'),
            //                   IconButton(
            //                     onPressed: () {
            //                       note(context);
            //                     },
            //                     icon: Icon(
            //                       Icons.arrow_forward_ios,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             SizedBox(
            //               height: 20,
            //             ),
            //             Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(15),
            //                 color: Color.fromARGB(255, 243, 218, 145),
            //               ),
            //               height: 75,
            //               width: double.infinity,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text('        DD/MM/YYYY HR:MS'),
            //                   IconButton(
            //                     onPressed: () {
            //                       note(context);
            //                     },
            //                     icon: Icon(
            //                       Icons.arrow_forward_ios,
            //                       color: Colors.black,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            BottomNavigationBar(
              //selectedIconTheme: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.pink,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  myIndex = index;
                });
              },
              currentIndex: myIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                    backgroundColor: Colors.amber),
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        note(context);
                      },
                      icon: Icon(
                        Icons.note,
                        size: 30,
                      ),
                    ),
                    label: '',
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        micai(context);
                      },
                      icon: Icon(
                        Icons.mic,
                        size: 30,
                      ),
                    ),
                    label: '',
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        home(context);
                      },
                      icon: Icon(
                        Icons.person_2_rounded,
                        size: 30,
                      ),
                    ),
                    label: '',
                    backgroundColor: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LoginScreen()), (route) => false);
  }

  micai(BuildContext ctx) async {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => SpeechScreen()), (route) => false);
  }

  note(BuildContext ctx) async {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => NoteScreen()), (route) => false);
  }

  void home(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => UserScreen()), (route) => false);
  }
}
