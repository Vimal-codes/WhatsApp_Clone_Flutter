import 'package:flutter/material.dart';

import '../data.dart';

class ChatScreen extends StatelessWidget {
  final Chat chat;

  const ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 35,
          toolbarHeight: 55,
          backgroundColor: const Color(0xFFFEFFFE),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(chat.imgPath),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Text(
                chat.name,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.videocam_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.call_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/image/chat.png",
                  fit: BoxFit.fill, // Adjust this as needed (e.g., BoxFit.fill, BoxFit.cover)
                  width: double.infinity, // Stretch the image to the full width
                ),
              ),
            ),
            Positioned(
              top: 615,
              left: 6,
              child: Row(
                children: [
                  Container(
                    width: 295, // Set the desired width for the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w100
                        ),
                        prefixIcon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.grey[700],
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.attach_file, color: Colors.grey[700], size: 22,),
                            SizedBox(width: 17),
                            Icon(Icons.camera_alt_outlined, color: Colors.grey[700]),
                            SizedBox(width: 10),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFFEFFFE),
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5), // Space between TextField and FloatingActionButton
                  Container(
                    height: 48, // Match the height of the TextField
                    width: 48, // Match the height for a circular button
                    decoration: BoxDecoration(
                      color: Color(0xFF23A462),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
