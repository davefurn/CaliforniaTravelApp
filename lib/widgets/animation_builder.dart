import 'package:flutter/material.dart';

import 'after_slider_list.dart';
import 'slider_widget.dart';

class AnimationBulding extends StatefulWidget {
  AnimationBulding({Key? key}) : super(key: key);

  @override
  State<AnimationBulding> createState() => _AnimationBuldingState();
}

class _AnimationBuldingState extends State<AnimationBulding> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => flag = !flag),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 1000),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        switchInCurve: Curves.easeInToLinear,
        switchOutCurve: Curves.linearToEaseOut,
        child: flag
            ? SlidingWidget(
                key: Key('1'),
              )
            : AfterSliderList(
                key: Key('2'),
              ),
      ),
    );
  }
}
