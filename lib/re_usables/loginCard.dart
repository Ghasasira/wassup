import 'package:flutter/material.dart';

class TextFieldWid extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChange;
  bool? obscure;
  TextFieldWid({
    super.key,
    required this.hintText,
    this.onChange,
    this.obscure,
  });

  // void show() {
  //   obscure = false;
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure ?? false,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            //do shit
          },
          icon: const Icon(Icons.clear),
        ),
      ),
    );
  }
}

class InButton extends StatelessWidget {
  final String? text;
  final Function()? handleData;
  const InButton({
    super.key,
    required this.text,
    this.handleData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Colors.blueAccent,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: handleData,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
