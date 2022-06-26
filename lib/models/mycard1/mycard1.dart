import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.red,
          height: 100,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
  ),
            margin: const EdgeInsets.only(left: 13.8, right: 13.8),
            child: Column(),
          ),
        );
      },
    );
  }
}
