import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return ChatPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFFFE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Image.asset(
                'assets/logo/logo.png',
                width: 60,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
