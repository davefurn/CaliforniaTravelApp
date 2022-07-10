import 'package:flutter/material.dart';
import 'package:travelapp1/buttons/menu_button.dart/my_drawer_header.dart';
import 'package:travelapp1/widgets/my_drawer_list.dart';

Drawer myDrawer(BuildContext context) {
  return Drawer(
    width: 280,
    backgroundColor: Color(0xfff303030),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyHeaderDrawer(),
          Align(alignment: Alignment.bottomLeft, child: myDrawerList(context)),
        ],
      ),
    ),
  );
}
