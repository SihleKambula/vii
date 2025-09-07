import 'package:flutter/material.dart';
import 'package:vii/src/features/authentication/widgets/custom_auth_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/vii.png', width: 100, height: 100),
                  const Text(
                    'Task. Record. Do',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'A personal PA in your pocket so you never miss a task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomAuthButton(
                    text: 'Continue with Google',
                    icon: Image.asset(
                      'assets/images/google_icon.png',
                      width: 15,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 15),
                  CustomAuthButton(
                    text: 'Continue with Apple',
                    icon: Image.asset(
                      'assets/images/apple_icon.png',
                      width: 15,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
