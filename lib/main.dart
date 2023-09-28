import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wassup/screens/welcome_screen.dart';
import 'package:wassup/screens/login_screen.dart';
import 'package:wassup/screens/registration_screen.dart';
import 'package:wassup/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wassup/signup_in_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(signUpController()));
  //if (!mounted) return;
  runApp(Wassup());
}

class Wassup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.welcome,
      routes: {
        WelcomeScreen.welcome: (context) => WelcomeScreen(),
        LoginScreen.login: (context) => LoginScreen(),
        RegistrationScreen.register: (context) => RegistrationScreen(),
        ChatScreen.chat: (context) => ChatScreen(),
      },
    );
  }
}
