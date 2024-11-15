import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat> myChat = [
    Chat(
      imgPath: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
      name: "John Doe",
      msgTitle: "Hey! How's it going?",
      time: "8:10 AM",
      readStatus: true,
      msgRec: true,
      unreadCount: 0,
      msgView: true,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1517841905240-472988babdf9",
      name: "Jane Smith",
      msgTitle: "Let's catch up tomorrow",
      time: "9:15 AM",
      readStatus: false,
      msgRec: true,
      unreadCount: 3,
      msgView: false,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
      name: "Michael Johnson",
      msgTitle: "Meeting rescheduled to 3 PM",
      time: "Yesterday",
      readStatus: true,
      msgRec: false,
      unreadCount: 0,
      msgView: true,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1527980965255-d3b416303d12",
      name: "Emily Davis",
      msgTitle: "Are you free this weekend?",
      time: "10:45 PM",
      readStatus: false,
      msgRec: true,
      unreadCount: 2,
      msgView: false,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df",
      name: "Robert Brown",
      msgTitle: "Can you send the documents?",
      time: "Yesterday",
      readStatus: false,
      msgRec: false,
      unreadCount: 0,
      msgView: true,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1511367461989-f85a21fda167",
      name: "Sophia Wilson",
      msgTitle: "I'll be there in 10 mins",
      time: "Yesterday",
      readStatus: false,
      msgRec: true,
      unreadCount: 0,
      msgView: true,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1502764613149-7f1d229e2307",
      name: "David Lee",
      msgTitle: "Happy Birthday!",
      time: "23/10/24",
      readStatus: false,
      msgRec: false,
      unreadCount: 0,
      msgView: false,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
      name: "Chloe White",
      msgTitle: "Do you need help with the project?",
      time: "18/10/24",
      readStatus: false,
      msgRec: true,
      unreadCount: 0,
      msgView: true,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1502378735452-bc7d86632805",
      name: "James Green",
      msgTitle: "Thanks for the update",
      time: "13/09/24",
      readStatus: false,
      msgRec: true,
      unreadCount: 4,
      msgView: false,
    ),
    Chat(
      imgPath: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
      name: "Olivia Martinez",
      msgTitle: "Call me when you're free",
      time: "14/8/24",
      readStatus: true,
      msgRec: false,
      unreadCount: 0,
      msgView: true,
    ),
  ];

  TextEditingController searchName = TextEditingController();

  //to store filter data
  List<Chat> filterData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Initially display all items
    filterData = myChat;
  }

  // Function to filter the list based on search input
  void filterSearch(String query) {
    List<Chat> tempList = [];
    if (query.isNotEmpty) {
      tempList = myChat.where((chat) => chat.name.toLowerCase().contains(query.toLowerCase())).toList();
      // Now `tempList` contains the filtered Chat objects where the name matches the query
    } else {
      // If the search query is empty, you can set the tempList back to the original list or handle accordingly.
      tempList = myChat;
    }
    // Update the state with the filtered list and rebuild the UI
    setState(() {
      filterData = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        right: true,
        left: true,
        child: Scaffold(
          backgroundColor: Color(0xFFFEFFFE),
          appBar: AppBar(
            backgroundColor: Color(0xFFFEFFFE),
            title: Text("WhatsApp", style: TextStyle(color: Color(0xFF23A462), fontWeight: FontWeight.bold, fontSize: 22),),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_scanner, color: Colors.black)),
              IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined, color: Colors.black)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.black))
            ],
          ),
          body:
          ListView(
            children: [
              SizedBox(
                height: 3,
              ),
              Container(
                height: 50,
                color:  Color(0xFFFEFFFE),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: TextField(
                    controller: searchName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF7F4F3),
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                      hintText: "Ask Meta or Search",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5E6363),
                      ),
                    ),
                    onChanged: (value){
                      filterSearch(value);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20, ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: filterData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFFFEFFFE),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 13,
                            child: Container(
                              height: 48,
                              width: 48,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage("${filterData[index].imgPath}"),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 76,
                            top: 2,
                            child: Text(
                              "${filterData[index].name}",
                              style: TextStyle(
                                color: Color(0xFF40474A),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          if (filterData[index].msgRec == true)
                            Positioned(
                              left: 78,
                              top: 24,
                              child: Text(
                                "${filterData[index].msgTitle}",
                                style: TextStyle(
                                  color: Color(0xFF6A6F71),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          if (filterData[index].msgRec == false)
                            Positioned(
                              left: 98,
                              top: 24,
                              child: Text(
                                "${filterData[index].msgTitle}",
                                style: TextStyle(
                                  color: Color(0xFF6A6F71),
                                  fontSize: 15,
                                ),
                              ),
                            ),

                          Positioned(
                            right: 13,
                            top: 7,
                            child: Text(
                              "${filterData[index].time}",
                              style: TextStyle(
                                color: Color(0xFF6A6F71),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // Unread count indicator
                          if (filterData[index].msgRec == true)
                            Positioned(
                                right: 13,
                                bottom: 10,
                                child: filterData[index].msgView == false? Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    "${filterData[index].unreadCount}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                                    : SizedBox.shrink()
                            )
                          // Read status icon
                          else
                            Positioned(
                              left: 76,
                              top: 25,
                              child: Icon(
                                Icons.done_all_sharp,
                                color: filterData[index].readStatus ? Colors.blue : Colors.grey,
                                size: 19,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: Container(
            height: 55,
            width: 55,
            child: FloatingActionButton(
              onPressed: (){},
              backgroundColor: Color(0xFF1DAA60),
              child: Center(child: Icon(Icons.add_comment_sharp, color: Colors.white, size: 25,)),
            ),
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
              backgroundColor: Color(0xFFFEFFFE),
              destinations: [
                const NavigationDestination(icon: Icon(Icons.chat, color: Colors.black), label: "Chats"),
                const NavigationDestination(icon: Icon(Icons.update_sharp, color: Colors.black), label: "Updates"),
                const NavigationDestination(icon: Icon(Icons.group, color: Colors.black), label: "Communities"),
                const NavigationDestination(icon: Icon(Icons.call, color: Colors.black), label: "Calls"),

              ],
            ),
          ),
        )
    );
  }
}