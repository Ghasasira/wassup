import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'message.dart';

class Store extends GetxController {
  static Store get instance => Get.find();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  sendmsg(data) async {
    try {
      await db.collection('messages').add(data);
    } on FirebaseException catch (e) {
      e.message;
    }
  }

  msgStream() async {
    await for (var snapshot in db.collection('messages').snapshots()) {
      for (var msg in snapshot.docs) {
        print(msg.data());
      }
    }
  }
}
