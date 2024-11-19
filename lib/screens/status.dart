import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';

import '../data.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  List<Statusmodel> statuslist = [
    Statusmodel(
        url: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1",
        name: "Helen",
        time: "6 minutes ago",
        isSeen: false, numberofStatus : 3),
    Statusmodel(
        url: "https://randomuser.me/api/portraits/men/22.jpg",
        name: "John",
        time: "45 minutes ago",
        isSeen: false, numberofStatus : 1),
    Statusmodel(
        url: "https://images.unsplash.com/photo-1517836357463-d25dfeac3438",
        name: "Emma",
        time: "10:30 am",
        isSeen: true, numberofStatus : 4),
    Statusmodel(
        url: "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
        name: "Michael",
        time: "6:10 am",
        isSeen: false, numberofStatus: 2),
    Statusmodel(
        url: "https://images.unsplash.com/photo-1551218808-94e220e084d2",
        name: "Sophia",
        time: "Yesterday",
        isSeen: true, numberofStatus: 3),
  ];

  List<StatusSeen> seenlist = [
    StatusSeen(
      url: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1",
      name: "Rose",
      time: "4:22 pm",
      isSeen: true, ),
    StatusSeen(
      url: "https://randomuser.me/api/portraits/men/22.jpg",
      name: "Nora",
      time: "Yesterday",
      isSeen:true,),
    StatusSeen(
      url: "https://images.unsplash.com/photo-1551218808-94e220e084d2",
      name: "david",
      time: "Yesterday",
      isSeen: true, )];

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
          title: Text("Updates",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 22
              )
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner, color: Colors.black)),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined, color: Colors.black)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black,)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.black))
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text("Status", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, )),
            ),
            SizedBox(height: 15 ),
            Row(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CircleAvatar(backgroundImage: AssetImage("assets/image/Vimal.jpg"), radius: 24,),
                    ),
                    Positioned(
                      top: 25,
                      left: 40,
                      child: Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFEFFFE)
                        ),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 41,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF23A462)
                        ),
                      ),
                    ),
                    Positioned(
                      top: 27,
                      left: 42,
                      child: Icon(Icons.add,  color: Color(0xFFFEFFFE), size: 19,),
                    ),
                  ],
                ),
                SizedBox(width: 14,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Status", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                    Text("Tap to add status update", style: TextStyle(fontSize: 14, color: Color(0xFF6A6F71)))
                  ],
                )
              ],
            ),
            SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Recent Updates", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF6A6F71))),
            ),
            SizedBox(height: 13,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: statuslist.length,
              itemBuilder: (BuildContext context, int index) {
                var list = statuslist[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    leading: StatusView(
                      radius: 27,
                      spacing: 15,
                      strokeWidth: 2,
                      indexOfSeenStatus: list.isSeen ? 2 : 0, // Show seen status
                      numberOfStatus: list.numberofStatus ?? 1,
                      padding: 4,
                      centerImageUrl: list.url,
                      seenColor: Colors.grey,
                      unSeenColor: Color(0xFF21C063),
                    ),
                    title: Text(
                      list.name,
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      list.time,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 16.0),
              child: Text(
                "Viewed updates",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF6A6F71))
              ),
            ),
            SizedBox(height: 11,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:seenlist.length,
              itemBuilder: (BuildContext context, int index) {
                var list = seenlist[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    leading: StatusView(
                      radius: 28,
                      spacing: 15,
                      strokeWidth: 2,
                      indexOfSeenStatus: list.isSeen ? 2 : 0, // Show seen status
                      numberOfStatus: 1,
                      padding: 4,
                      centerImageUrl: list.url,
                      seenColor: Colors.grey,
                      unSeenColor: Color(0xFF21C063),
                    ),
                    title: Text(
                      list.name,
                      style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      list.time,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ],
        )

      ),
    );
  }
}
