import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text, BuildContext context) {
    

    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: const Color.fromARGB(255, 42, 108, 207),
    );
      ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
  
}
