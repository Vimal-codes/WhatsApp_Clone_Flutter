import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import 'chatscreen.dart';


class Contact_list extends StatefulWidget {
  const Contact_list({super.key});

  @override
  State<Contact_list> createState() => _Contact_listState();
}

class _Contact_listState extends State<Contact_list> {
  List<Contact> Contactlist = [
    Contact(
      name: 'Amelia Carter',
      subtitle: 'Nature lover 🌿',
      url: 'assets/image/profile/w5.jpg',
    ),
    Contact(
      name: 'Benjamin Moore',
      subtitle: 'Tech enthusiast 💻',
      url: 'assets/image/profile/m4.jpg',
    ),
    Contact(
      name: 'Chloe White',
      subtitle: 'Life’s too short for bad coffee ☕',
      url: 'assets/image/profile/w4.jpg',
    ),
    Contact(
      name: 'David Lee',
      subtitle: 'Lost in music 🎵, found in books 📖',
      url: 'assets/image/profile/m7.jpg',
    ),
    Contact(
      name: 'Ella Scott',
      subtitle: 'Coffee addict ☕',
      url: 'assets/image/profile/w6.jpg',
    ),
    Contact(
      name: 'Emily Davis',
      subtitle: 'Catching sunsets and chasing dreams!',
      url: 'assets/image/profile/w3.jpg',
    ),
    Contact(
      name: 'Hannah White',
      subtitle: 'Photographer at heart 📸',
      url: 'assets/image/profile/w7.jpg',
    ),
    Contact(
      name: 'James Green',
      subtitle: 'Coding by day, gaming by night 🎮',
      url: 'assets/image/profile/m5.jpg',
    ),
    Contact(
      name: 'Jane Smith',
      subtitle: 'The world is my playground 🌍',
      url: 'assets/image/profile/w1.jpg',
    ),
    Contact(
      name: 'John Doe',
      subtitle: 'Loving the little things 🌸',
      url: 'assets/image/profile/m1.jpg',
    ),
    Contact(
      name: 'Lucas Wright',
      subtitle: 'Always on the go 🚀',
      url: 'assets/image/profile/m8.jpg',
    ),
    Contact(
      name: 'Michael Johnson',
      subtitle: 'Dreaming big, living small ✨',
      url: 'assets/image/profile/m2.jpg',
    ),
    Contact(
      name: 'Nathan Hill',
      subtitle: 'Foodie exploring the world 🌍',
      url: 'assets/image/profile/m9.jpg',
    ),
    Contact(
      name: 'Olivia Martinez',
      subtitle: 'Bookworm in a tech-driven world 📚💻',
      url: 'assets/image/profile/w2.jpg',
    ),
    Contact(
      name: 'Robert Brown',
      subtitle: 'Exploring life one step at a time 🎌',
      url: 'assets/image/profile/m6.jpg',
    ),
    Contact(
      name: 'Sophia Wilson',
      subtitle: "I believe in kindness, coffee, and late-night talks ☕",
      url: 'assets/image/profile/w3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEFFFE),
        titleSpacing: 0,
        leading: InkWell(child: Icon(Icons.arrow_back_sharp, color: Colors.black, size: 26),
          onTap: (){
            Navigator.pop(context);
          },),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 1),
            Text("10 contacts", style: TextStyle(color: Color(0xFF6A6F71), fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_sharp),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Color(0xFFFEFFFE),
      body: ListView(
        children: [
          SizedBox(height: 6),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF25D366), // Green WhatsApp color
              child: Icon(
                Icons.group_add_sharp,
                color: Color(0xFFFEFFFE),
              ),
            ),
            title: const Text(
              "New group",
              style: TextStyle(color: Color(0xFF40474A), fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          SizedBox(height: 8),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF25D366),
              child: Icon(
                Icons.person_add_alt_sharp,
                color: Color(0xFFFEFFFE),
              ),
            ),
            title: const Text(
              "New contact",
              style: TextStyle(color: Color(0xFF40474A), fontSize: 18, fontWeight: FontWeight.w500),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: const Icon(
                Icons.qr_code,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(height: 8),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFF25D366),
              child: Icon(
                Icons.groups, size: 28,
                color: Color(0xFFFEFFFE),
              ),
            ),
            title: const Text(
              "New community",
              style: TextStyle(color: Color(0xFF40474A), fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 17.0),
            child: Text("Contacts on WhatsApp", style: TextStyle(color: Color(0xFF6A6F71), fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 6),
          ListTile(
            leading: Container(
              height: 48,
              width: 48,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/image/Vimal.jpg"),
              ),
            ),
            title: Text(
              "Vimal (You)",
              style: const TextStyle(color: Color(0xFF40474A), fontWeight: FontWeight.w500 , fontSize: 17),
            ),
            subtitle: Text(
              "Message yourself",
              style: const TextStyle(color: Color(0xFF6A6F71)),
            ),
          ),
          // List of contacts
          ListView.builder(
            shrinkWrap: true, // Prevents the builder from taking up too much space
            physics: NeverScrollableScrollPhysics(), // Disable scrolling for this list, it's handled by the parent ListView
            itemCount: Contactlist.length,
            itemBuilder: (BuildContext context, int index) {
              final contact = Contactlist[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(contact: Contactlist[index]),
                    ),
                  );
                },
                leading: Container(
                  height: 48,
                  width: 48,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(contact.url),
                  ),
                ),
                title: Text(
                  contact.name,
                  style: const TextStyle(color: Color(0xFF40474A), fontWeight: FontWeight.w500, fontSize: 17),
                ),
                subtitle: Text(
                  contact.subtitle,
                  style: const TextStyle(color: Color(0xFF6A6F71)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}