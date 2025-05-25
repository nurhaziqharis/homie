import 'dart:js';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homie_web/views/homepage/homepage_admin.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();

  final TextEditingController _password = TextEditingController();

  bool checkLoginCredential() {
    if (_username.text == 'zapwareadmin' && _password.text == '1') {
      return true;
    } else {
      return false;
    }
  }

  void goToHomepage(BuildContext context) {
    final loginResult = checkLoginCredential();
    if (loginResult) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login success'), backgroundColor: Colors.green,),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomepageAdmin()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid login credentials'), backgroundColor: Colors.red,),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity, // Full screen
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                //color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          //color: Colors.yellow,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Zapware Solutions',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Welcome to Homie',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28),
                                      ),
                                      Text('Sign into your account'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Spacer(),
                      Expanded(
                        flex: 1,
                        child: Container(
                          //color: Colors.teal,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 80),
                                child: Container(
                                  //color: Colors.pinkAccent,
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _username,
                                        onSubmitted: (_) => goToHomepage(context),
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal:
                                                  12), // ⬅️ reduce height
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      TextField(
                                        controller: _password,
                                        onSubmitted: (_) => goToHomepage(context),
                                        decoration: InputDecoration(
                                          focusColor: Colors.yellowAccent,
                                          hintText: 'Password',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal:
                                                  12), // ⬅️ reduce height
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                12), // ⬅️ rounder corners
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () => goToHomepage(context),
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: Text('Sign In'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Forgot Password',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.asset(
                          'klcc.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
