import 'package:flutter/material.dart';
import '../widgets/textcontroller.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                      color: Colors.orangeAccent,
                      child: Column(
                        children: [
                          Spacer(),
                          Text('Register Now!', style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 28),),
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
                        color: Colors.lightBlueAccent,
                        child: Column(
                          children: [
                            customTextController(
                                hintText: 'Email',
                                context: context,
                                controller: _email,
                                onSubmitted: submitNewRegistration),
                            SizedBox(height: 8),
                            customTextController(
                                hintText: 'Password',
                                context: context,
                                controller: _password,
                                onSubmitted: submitNewRegistration),
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
