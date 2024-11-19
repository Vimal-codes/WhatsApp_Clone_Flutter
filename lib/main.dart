import 'package:chatpage/screens/callpage.dart';
import 'package:chatpage/screens/chatscreen.dart';
import 'package:chatpage/screens/communities.dart';
import 'package:chatpage/screens/home.dart';
import 'package:chatpage/screens/splash.dart';
import 'package:chatpage/screens/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFFEFFFE)),
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}

