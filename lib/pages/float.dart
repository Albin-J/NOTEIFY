// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noteify2/pages/home.dart';
import 'package:noteify2/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FloatingScreen extends StatelessWidget {
  const FloatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Button'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                home(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: (() {
              startFloatingService();
            }),
            child: Text('record'),
          ),
        ),
      ),
    );
  }

  home(BuildContext ctx) async {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => HomeScreen()), (route) => false);
  }

  void startFloatingService() {
    MethodChannel('com.example.floatingrecorder/service')
        .invokeMethod('startService');
  }
}
