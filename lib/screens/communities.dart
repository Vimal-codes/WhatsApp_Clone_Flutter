import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        backgroundColor: Color(0xFFFEFFFE),
        appBar: AppBar(
          backgroundColor: Color(0xFFFEFFFE),
          title: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text("Communities",
                style: TextStyle(
                  fontFamily: 'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 21
                )
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner, color: Colors.black)),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined, color: Colors.black)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.black))
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 25,),
            Container(
              height: 200,
              width: 200,
              child: Image(image: AssetImage("assets/image/commy.png")),
            ),
            const Text(
              "Stay connected with a community",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Communities bring members together in topic-based groups, and make it easy to get admin announcements. Any community you’re added to will appear here.",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Colors.black,
                  height: 1.5, // Line height
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Text("See example communities >",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: Color(0xFF1A73E8),
                height: 1.5, // Line height
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: Color(0xFF23A462),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                  shape: const StadiumBorder(),
                ),
                child: Text("Start your community"),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Color(0xFFD9FCD2),
              labelTextStyle: WidgetStateProperty.all(
                TextStyle(color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),

              )
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            destinations: [
              const NavigationDestination(icon: Icon(Icons.chat, color: Colors.black), label: "Chats"),
              const NavigationDestination(icon: Icon(Icons.update_sharp, color: Colors.black), label: "Updates"),
              const NavigationDestination(icon: Icon(Icons.group, color: Colors.black), label: "Communities"),
              const NavigationDestination(icon: Icon(Icons.call, color: Colors.black), label: "Calls"),
            ],
          ),
        ),
      ),
    );
  }
}
