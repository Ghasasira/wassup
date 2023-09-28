import 'package:flutter/material.dart';
import 'package:wassup/screens/login_screen.dart';
import 'package:wassup/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wassup/re_usables/welcome.dart';

class WelcomeScreen extends StatefulWidget {
  static const String welcome = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      upperBound: 1,
      lowerBound: 0.09,
      vsync: this,
    );
    //animation = CurvedAnimation(parent: controller!, curve: Curves.bounceInOut);
    animation =
        ColorTween(begin: Colors.grey, end: Color.fromARGB(255, 39, 75, 58))
            .animate(controller!);
    controller?.forward();

    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value, //Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(
                    'Flash Chat',
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.green,
                    ),
                  )
                ]),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: WelcomeTa(
                text: 'Log in',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.login);
                },
                color: Colors.lightBlueAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: WelcomeTa(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.register);
                },
                text: 'Register',
              ),
            )
          ],
        ),
      ),
    );
  }
}
