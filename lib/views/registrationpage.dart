import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/textcontroller.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _submitLogin(BuildContext context) async {
    final url = Uri.parse('http://your-api-url.com/login');
    final Map<String, dynamic> requestBody = {
      'email': _email.text.trim(),
      'password': _password.text.trim(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Login success: $data');
        // Navigate or store token etc.
      } else {
        print('Login failed: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              'klcc.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.green,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //color: Colors.orangeAccent,
                      child: Column(
                        children: [
                          Spacer(),
                          Text(
                            'Register Now!',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0),
                      child: Container(
                        //color: Colors.lightBlueAccent,
                        child: Column(
                          children: [
                            customTextController(hintText: 'Email', context: context, controller: _email, onSubmitted: submitNewRegistration),
                            SizedBox(height: 8),
                            customTextController(hintText: 'Password', context: context, controller: _password, onSubmitted: submitNewRegistration),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text('Register'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void submitNewRegistration() {
  print('Submit new registration');
}
