class Chat {
  final String imgPath;
  final String name;
  final String msgTitle;
  final String time;
  final bool readStatus;
  final bool msgRec;
  final bool msgView;
  final int unreadCount;

  Chat({
    required this.imgPath,
    required this.name,
    required this.msgTitle,
    required this.time,
    required this.readStatus,
    required this.msgRec, // Default value
    required this.msgView,
    this.unreadCount = 0,
  });
}
