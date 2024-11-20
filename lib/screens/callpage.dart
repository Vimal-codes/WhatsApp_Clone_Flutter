import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class CallPageScreen extends StatefulWidget {
  const CallPageScreen({super.key});

  @override
  State<CallPageScreen> createState() => _CallPageScreenState();
}

class _CallPageScreenState extends State<CallPageScreen> {

  List<Call> callList = [
    Call(
      url: "assets/image/profile/w1.jpg",
      names: "Jane Smith",
      time: "45 minutes ago",
      callstatus: false,
      attended: true,
      calltype: true,
    ),
    Call(
      url: "assets/image/profile/m4.jpg",
      names: "David Lee",
      time: "Today, 2:30 pm",
      callstatus: false,
      attended: false,
      calltype: true,
    ),
    Call(
      url: "assets/image/profile/m2.jpg",
      names: "Michael Johnson",
      time: "Today, 9:12 am",
      callstatus: false,
      attended: true,
      calltype: true,
    ),
    Call(
      url: "assets/image/profile/m4.jpg",
      names: "David Lee",
      time: "Yesterday, 11:30 pm",
      callstatus: true,
      attended: false,
      calltype: false,
    ),
    Call(
      url: "assets/image/profile/m4.jpg",
      names: "David Lee",
      time: "Yesterday, 11:29 pm",
      callstatus: false,
      attended: false,
      calltype: true,
    ),
    Call(
      url: "assets/image/profile/m4.jpg",
      names: "David Lee",
      time: "Yesterday, 10:46 pm",
      callstatus: false,
      attended: true,
      calltype: false,
    ),
    Call(
      url: "assets/image/profile/m5.jpg",
      names: "James Green",
      time: "Yesterday, 8:23 pm",
      callstatus: false,
      attended: true,
      calltype: true,
    ),
    Call(
      url: "assets/image/profile/w3.jpg",
      names: "Sophia Wilson",
      time: "Yesterday, 5:02 pm",
      callstatus: false,
      attended: false,
      calltype: false,
    ),
    Call(
      url: "assets/image/profile/m1.jpg",
      names: "John Doe",
      time: "Yesterday, 3:42 pm",
      callstatus: true,
      attended: true,
      calltype: true,
    ),
  ];




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Color(0xFFFEFFFE),
        appBar: AppBar(
          backgroundColor: Color(0xFFFEFFFE),
          title: Text(
            "Calls", 
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 23
            )
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner,color: Colors.black,)),
            SizedBox(width: 2,),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined, color: Colors.black,)),
            SizedBox(width: 2,),
            IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black,)),
            SizedBox(width: 2,),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.black,))
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Text(
                "Favorites",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 17),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Color(0xFF23A462),
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 21,
                      color: Color(0xFFFEFFFE),
                    ),
                  ),
                  SizedBox(width: 19,),
                  Text("Add Favourite", style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Text(
                "Recent",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: callList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(callList[index].url),
                  ),
                  title: Text(
                    callList[index].names,
                    style: TextStyle(color: callList[index].callstatus || callList[index].attended ? Colors.black : Colors.red, fontSize: 17),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        callList[index].callstatus ? Icons.call_received_sharp : Icons.call_made_outlined,
                        size: 18,
                          color: callList[index].callstatus || callList[index].attended ? Colors.green : Colors.red
                      ),
                      SizedBox(width: 4,),
                      Text(callList[index].time, style: TextStyle(color: Colors.grey[700], fontSize: 15),)
                    ],
                  ),
                  trailing: Icon(
                    callList[index].calltype  ? Icons.call_outlined : Icons.videocam_outlined,
                    color: Colors.black87,
                    size: callList[index].calltype  ? 24 : 27
                  ),
                );
              },

            )
          ],
        ),
        floatingActionButton: Container(
          height: 55,
          width: 55,
          child: FloatingActionButton(
            onPressed: () {  },
            backgroundColor: Color(0xFF1DAA60),
            child: Center(child: Icon(Icons.add_ic_call_sharp, color: Colors.white, size: 25,)),
          ),
        ),
      ),
    );
  }
}