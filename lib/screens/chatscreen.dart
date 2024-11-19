import 'package:flutter/material.dart';

import '../data.dart';

class ChatScreen extends StatefulWidget {

  final Contact contact;

  const ChatScreen({Key? key, required this.contact}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _messageController = TextEditingController();
  bool _isTyping = false;  // To track if the user is typing

  @override
  void initState() {
    super.initState();
    // Add a listener to the controller to detect text changes
    _messageController.addListener(_onMessageChanged);
  }

  @override
  void dispose() {
    // Remove the listener and dispose the controller
    _messageController.removeListener(_onMessageChanged);
    _messageController.dispose();
    super.dispose();
  }

  // Function to update the state when the message changes
  void _onMessageChanged() {
    setState(() {
      _isTyping = _messageController.text.isNotEmpty;  // Check if there's any text
    });
  }

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
                backgroundImage: NetworkImage(widget.contact.url),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Text(
                widget.contact.name,
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
            Positioned.fill(
              child: Image.asset(
                "assets/image/chat.png",
                fit: BoxFit.cover, // Adjust this as needed (e.g., BoxFit.fill, BoxFit.cover)
                width: double.infinity, // Stretch the image to the full width
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
                      controller: _messageController, // Attach the controller
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                        ),
                        prefixIcon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.grey[700],
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: Colors.grey[700],
                              size: 22,
                            ),
                            SizedBox(width: 17),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey[700],
                            ),
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
                      onPressed: () {
                        if (_isTyping) {
                          // Send the message
                          _messageController.clear();  // Clear input field after sending message
                        } else {
                          // Start recording if the mic is clicked
                        }
                      },
                      icon: Icon(
                        _isTyping ? Icons.send_sharp : Icons.mic,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );;
  }
}

