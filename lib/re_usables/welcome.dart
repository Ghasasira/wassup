import 'package:flutter/material.dart';

class WelcomeTa extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? onPressed;

  const WelcomeTa({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color, //Colors.blueAccent,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          text!, //'Register',
        ),
      ),
    );
  }
}
