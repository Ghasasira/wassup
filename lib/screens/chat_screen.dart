import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:wassup/auth.dart';
import 'package:wassup/constants.dart';
import 'package:wassup/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wassup/store.dart';
import 'package:get/get.dart';
import 'package:wassup/signup_in_controller.dart';

class ChatScreen extends StatefulWidget {
  static String chat = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final controller = Get.put(signUpController());
  final store = Get.put(Store());
  User? loggedInUser;
  String? msgTxt;
  //FirebaseUser loggedInUser

  void getCurrentUser() async {
    try {
      final user = await signUpController.instance.firebaseUser();
      debugPrint(user!.email);
      if (user != null) {
        loggedInUser = user;
      }
    } on FirebaseAuthException catch (e) {
      (e.message);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                try {
                  await signUpController.instance.signOut();
                  if (!mounted) return;
                  Navigator.pushNamed(context, LoginScreen.login);
                } on FirebaseAuthException catch (e) {
                  debugPrint(e.message);
                }
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: store.db.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final msgs = snapshot.data!.docs;
                List<MsgBubble> chatMessages = [];
                for (var msg in msgs) {
                  final text = msg['text'];
                  final sender = msg['sender'];

                  final currentUser = loggedInUser!.email;

                  final msgBubble = MsgBubble(
                    sender: sender,
                    text: text,
                    myMsg: currentUser == sender ? true : false,
                  );
                  chatMessages.add(msgBubble);
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    children: chatMessages,
                  ),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        msgTxt = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      messageTextController.clear();
                      await store.sendmsg(
                        {'text': msgTxt, 'sender': loggedInUser!.email},
                      );
                      //Implement send functionality.
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
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

class MsgBubble extends StatelessWidget {
  const MsgBubble(
      {super.key,
      required this.sender,
      required this.text,
      required this.myMsg});

  final String? sender;
  final String? text;
  final bool myMsg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            myMsg ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 10.0,
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              topRight: myMsg ? Radius.circular(0.0) : Radius.circular(20.0),
              topLeft: myMsg ? Radius.circular(20.0) : Radius.circular(0.0),
            ),
            elevation: 10.0,
            color:
                myMsg ? Color.fromARGB(200, 255, 255, 255) : Colors.lightBlue,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: myMsg ? Color.fromARGB(255, 0, 0, 0) : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
