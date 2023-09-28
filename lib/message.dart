import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String text;
  String sender;

  Message({required this.text, required this.sender});

  factory Message.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Message(sender: data['sender'], text: data['text']);
  }
}
