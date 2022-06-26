import 'package:flutter/material.dart';
import 'package:travelapp1/buttons/menu_button.dart/my_drawer_header.dart';
import 'package:travelapp1/widgets/my_drawer_list.dart';

Drawer myDrawer() {
  return Drawer(
    width: 280,
    backgroundColor:  Colors.black87,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyHeaderDrawer(),
          Align(alignment: Alignment.bottomLeft, child: myDrawerList()),
        ],
      ),
    ),
  );
}