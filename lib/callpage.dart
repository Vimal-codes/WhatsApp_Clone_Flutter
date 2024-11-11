import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallPageScreen extends StatefulWidget {
  const CallPageScreen({super.key});

  @override
  State<CallPageScreen> createState() => _CallPageScreenState();
}

class _CallPageScreenState extends State<CallPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFEFFFE),
          title: Text("WhatsApp", style: TextStyle(color: Color(0xFF23A462), fontWeight: FontWeight.bold, fontSize: 22),),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner)),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }
}
