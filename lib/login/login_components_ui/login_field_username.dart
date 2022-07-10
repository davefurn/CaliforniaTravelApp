

import 'package:flutter/material.dart';

class Component12 extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassWord;
  final bool isEmail;
  final TextEditingController controller;

  const Component12(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.isPassWord,
      required this.isEmail, required this.controller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: size.width / 8,
        width: size.width / 1.2,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: size.width / 30),
        decoration: BoxDecoration(
          color: const Color(0xfffefefe),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          style: const TextStyle(color: Color(0xff192028)),
          cursorColor: const Color(0xff192028),
         
          textInputAction:
              isPassWord ? TextInputAction.done : TextInputAction.next,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(17),
            prefixIcon: Icon(
              size: 21,
              icon,
              color: const Color(0xffb5b9bc),
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xffb5b9bc)),
          ),
        ),
      ),
    );
  }
}
