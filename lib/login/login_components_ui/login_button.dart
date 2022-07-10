import 'dart:ui';

import 'package:flutter/material.dart';

class Component2 extends StatelessWidget {
   
 final String string;
 final double width;
 final VoidCallback voidCallback;

  const Component2({Key? key, required this.string, required this.width, required this.voidCallback,  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 15,
        sigmaY: 15,
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: voidCallback,
        child: Container(
          height: size.width / 8,
          width: size.width / width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 42, 108, 207),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            string,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
 }
}

class Component222 extends StatelessWidget {
   
 final String string;
 final double width;
 final VoidCallback voidCallback;

  const Component222({Key? key, required this.string, required this.width, required this.voidCallback,  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 15,
        sigmaY: 15,
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: voidCallback,
        child: Container(
          height: size.width / 8,
          width: size.width / width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffff735c),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            string,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
 }
}

