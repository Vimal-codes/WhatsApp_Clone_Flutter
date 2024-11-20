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
  bool _isTyping = false; // To track if the user is typing
  List<Map<String, String>> _messages = []; // List to store messages

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onMessageChanged);
  }

  @override
  void dispose() {
    _messageController.removeListener(_onMessageChanged);
    _messageController.dispose();
    super.dispose();
  }

  void _onMessageChanged() {
    setState(() {
      _isTyping = _messageController.text.isNotEmpty;
    });
  }

  // Function to format the time manually
  String _formatTime(String timeString) {
    try {
      final DateTime time = DateTime.parse(timeString);
      int hour = time.hour;
      int minute = time.minute;

      String amPm = hour >= 12 ? "PM" : "AM";
      hour = hour % 12;
      if (hour == 0) hour = 12;

      return "$hour:${minute.toString().padLeft(2, '0')} $amPm";
    } catch (e) {
      return 'Invalid Time';
    }
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
                backgroundImage: AssetImage(widget.contact.url),
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
            // Background image
            Positioned.fill(
              child: Image.asset(
                "assets/image/chat.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            // Messages list and input
            Column(
              children: [
                // Message display area
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD8FDD2), // Chat bubble color
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 19,
                                    left: 15,
                                    right: 40,
                                  ),
                                  child: Text(
                                    _messages[index]['text']!,
                                    style: TextStyle(color: Color(0xFF40474A), fontSize: 16),
                                  ),
                                ),
                                Positioned(
                                  bottom: 4,
                                  right: 10,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        _formatTime(_messages[index]['time']!),
                                        style: TextStyle(
                                          color: Color(0xFF8D9598),
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(
                                        Icons.done_all,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Message input field
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
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
                                SizedBox(width: 15),
                                Icon(
                                  Icons.paid_sharp,
                                  color: Colors.grey[700],
                                  size: 22,
                                ),
                                SizedBox(width: 15),
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
                      const SizedBox(width: 5),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFF23A462),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (_isTyping) {
                              setState(() {
                                _messages.add({
                                  'text': _messageController.text,
                                  'time': DateTime.now().toIso8601String(),
                                });
                              });
                              _messageController.clear();
                            }
                          },
                          icon: Icon(
                            _isTyping ? Icons.send_sharp : Icons.mic,
                            size: 25,
                            color: Color(0xFFFEFFFE),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}