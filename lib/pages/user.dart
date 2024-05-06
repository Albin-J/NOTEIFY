// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:noteify2/pages/home.dart';
import 'package:noteify2/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                home(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text('Verify Screen'),
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

  home(BuildContext ctx) async {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => HomeScreen()), (route) => false);
  }
}
