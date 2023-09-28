import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wassup/re_usables/consts.dart';
import 'package:wassup/re_usables/loginCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wassup/screens/chat_screen.dart';
import 'package:wassup/signup_in_controller.dart';
//import 'package:wassup/auth.dart';
//import 'package:delayed_consumer_hud/delayed_consumer_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String register = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final controller = Get.put(signUpController());
  String errorMsg = '';
  bool isLogIn = false;

  // Future<void> createUser({required String email, required password}) async {
  //   await Auth()
  //       .createUserWithEmailAndPassword(email: email, password: password);
  // }

  String? user_email;
  String? user_password;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.orangeAccent,
              ),
              onChanged: (value) {
                //setState(() {
                user_email = value;
                //}); //Do something with the user input.
              },
              decoration: kInputDecoration.copyWith(hintText: 'enter email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: obscure,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.orangeAccent,
                ),
                onChanged: (value) {
                  //setState(() {
                  user_password = value;
                  //});
                  //Do something with the user input.
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'enter password')),
            Row(
              children: [
                Switch(
                    value: obscure,
                    activeColor: Colors.blue,
                    onChanged: (bool value) {
                      setState(() {
                        obscure = !obscure;
                      });
                    }),
                const Text(
                  'show password',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            InButton(
              text: 'Register',
              handleData: () async {
                try {
                  await signUpController.instance
                      .createUserWithEmailAndPassword(
                          email: user_email!, password: user_password!);
                  if (!mounted) return;
                  Navigator.pushNamed(context, ChatScreen.chat);
                } on FirebaseAuthException catch (e) {
                  debugPrint(e.message);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
