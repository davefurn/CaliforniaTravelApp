import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ItemMenu extends StatelessWidget {
  final Icon icons;
  final String label;
  final VoidCallback ontap;

  const ItemMenu({
    Key? key,
    required this.icons,
    required this.label,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.229,
      child: Material(
        elevation: 2,
        shadowColor: Colors.grey,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: ontap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icons, // <-- Icon
              Text(
                label,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ), // <-- Text
            ],
          ),
        ),
      ),
    );
  }
}