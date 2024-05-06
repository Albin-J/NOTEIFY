// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_import, use_super_parameters, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noteify2/main.dart';
import 'package:noteify2/pages/forget.dart';
import 'package:noteify2/pages/home.dart';
import 'package:noteify2/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  String head = 'LOG IN';

  bool isDataMatched = true;
  bool security = true;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: const Text('Welcome Back!')),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // LOGIN
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              head,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.person_2_outlined),
                              fillColor: Colors.white,
                              hintText: 'Username',
                            ),
                            validator: (value) {
                              // if (isDataMatched) {
                              //   return null;
                              // } else {
                              //   return 'Error';
                              // }
                              if (value == null || value.isEmpty) {
                                return 'Value is Empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: security,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              prefixIcon: Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    security = !security;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              // if (isDataMatched) {
                              //   return null;
                              // } else {
                              //   return 'Error';
                              // }
                              if (value == null || value.isEmpty) {
                                return 'Value is Empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            // height: 20.0,
                            // width: double.infinity,
                            //color: Colors.white,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  checkForget();
                                },
                                child: const Text(
                                  'Forget Password',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: !isDataMatched,
                                child: const Text(
                                  'Username Password doesnot match',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    checkLogin(context);
                                  } else {
                                    print('Data Empty');
                                  }
                                  // checkLogin(context);
                                },
                                child: const Text('LOG IN'),
                              ),
                              const Text(' ')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //     flex: 0,
                  //     child: Container(
                  //       color: Colors.white,
                  //     )),
                  //  SIGNUP
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Or Sign in With',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                  'assets/images/googleblack.png',
                                  height: 70,
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                signup();
                              },
                              child: Text(
                                'new to NOTEIFY ? Sign Up',
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == password) {
      print('Username Password Match');

      //Goto Home

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(Save_Key_Name, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
    } else {
      String errmsg = 'Username Password doesnot match';

      //SnackBar
      // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      //     behavior: SnackBarBehavior.floating,
      //     backgroundColor: Colors.red,
      //     margin: EdgeInsets.all(10),
      //     content: Text(errmsg)));

      //Alert dailog
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(errmsg),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          });

      //show text
      // setState(() {
      //   isDataMatched = false;
      // });

      print('Username Password doesnot Match');
    }
  }

  void checkForget() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx1) => ForgetScreen()));
  }

  void signup() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx1) => SignUp()));
  }
}
