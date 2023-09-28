import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:wassup/auth.dart';
import 'package:wassup/re_usables/loginCard.dart';
import 'package:wassup/screens/chat_screen.dart';
import 'package:wassup/screens/registration_screen.dart';
import 'package:get/get.dart';
import 'package:wassup/signup_in_controller.dart';

class LoginScreen extends StatefulWidget {
  static String login = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(signUpController());
  String? user_email;
  String? user_password;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[100],
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
              TextFieldWid(
                hintText: 'Enter your email',
                onChange: (value) {
                  user_email = value;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFieldWid(
                hintText: 'Enter your password.',
                obscure: obscure,
                onChange: (value) {
                  user_password = value;
                },
              ),
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
                text: 'Login',
                handleData: () async {
                  try {
                    await signUpController.instance.signInWithEmailAndPassword(
                        email: user_email!, password: user_password!);
                    if (!mounted) return;
                    Navigator.pushNamed(context, ChatScreen.chat);
                  } on FirebaseAuthException catch (e) {
                    debugPrint(e.message);
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.register);
                },
                child: const Center(
                  child: Text(
                    'Have no account! Signup instead',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
