class Thread {
  String threadID;
  String name;
  String message;

  Thread.fromJson(Map<String, dynamic> json)
      : threadID = json['threadID'],
        name = json['name'],
        message = json['message'];
}
