import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelapp1/screens/home_screen.dart';

import 'route_generator.dart';

void main() {
  runApp(const MyApp());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: theme,
    );
  }
}

ThemeData get theme => ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF359c8b),
    );
