import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(onPressed: onPressed,
    color: Colors.yellow[600],
    child: Text(text),
    );
  }

}
