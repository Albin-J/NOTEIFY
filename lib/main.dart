// ignore_for_file: prefer_const_constructors, unused_import, constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
// import 'dart:ui_web';
import 'pages/splash.dart';

const Save_Key_Name = 'UserLoggedIn';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //           apiKey: "AIzaSyC1WKucI7Wf6RSVs7BXReTdjn23uvp3isk",
  //           appId: "1:800094253477:web:b0b642abc3977f2514f84c",
  //           messagingSenderId: "800094253477",
  //           projectId: "notiefy-deac8"));
  // }
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOTEIFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 248, 241, 241),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
