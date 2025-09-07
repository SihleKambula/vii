import 'package:flutter/material.dart';
import 'package:vii/src/features/authentication/screens/authentication.dart';

class ViiWrapper extends StatefulWidget {
  const ViiWrapper({super.key});

  @override
  State<ViiWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<ViiWrapper> {
  @override
  Widget build(BuildContext context) {
    return const AuthenticationScreen();
  }
}
