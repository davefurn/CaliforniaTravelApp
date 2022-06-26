import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHeaderDrawer extends StatefulWidget {
  MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/abcd.jpg',
          ),
          fit: BoxFit.fill
        ),
      ),
      width: double.infinity,
      height: 139,
      child: Container(
        alignment: Alignment.center,
        child: 
          Text(
            'California ',
            style: GoogleFonts.lato(
              fontSize: 33,
              fontWeight: FontWeight.w200,
              color:  Colors.grey[200],
            ),

          ),
      ),
    );
  }
}
