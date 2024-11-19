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

class Call {
  final String url;
  final String names;
  final String time;
  final bool callstatus;
  final bool attended;
  final bool calltype;

  Call(
      {required this.url,
      required this.names,
      required this.time,
      required this.callstatus,
      required this.attended,
      required this.calltype});
}

class Statusmodel {
  final String url;
  final String name;
  final String time;
  final bool isSeen;
  final int numberofStatus;

  Statusmodel({
    required this.url,
    required this.name,
    required this.time,
    required this.isSeen,
    this.numberofStatus = 1
  });
}

class StatusSeen {
  final String url;
  final String name;
  final String time;
  final bool isSeen;

  StatusSeen({
    required this.url,
    required this.name,
    required this.time,
    required this.isSeen,
  });
}
