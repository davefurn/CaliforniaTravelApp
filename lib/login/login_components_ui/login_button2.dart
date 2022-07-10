import 'dart:ui';

import 'package:flutter/material.dart';

class Component22 extends StatelessWidget {
  final String string;
  final double width;
  final VoidCallback voidCallback;
  final Image icon;

  const Component22({
    Key? key,
    required this.string,
    required this.width,
    required this.voidCallback, required this.icon,
  }) : super(key: key);

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
              color: const Color(0xfff1f5f6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only( left: 70, top: 15, bottom: 15,),
                  child: icon,
                ),
                
               
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Text(
                    string,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                        color: Colors.black,
                        ),
                  ),
                ),

                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
