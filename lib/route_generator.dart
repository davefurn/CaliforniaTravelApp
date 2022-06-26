import 'package:flutter/material.dart';
import 'package:travelapp1/screens/home_screen.dart';
import 'package:travelapp1/screens/next_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //getting arguments passed in while calling navigator.pushnamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'second':
        if (args is dynamic) {
          return MaterialPageRoute(builder: (_) => NextPage());
        }
        return _errorPage();
      // case 'loginPage':
      //  return MaterialPageRoute(builder: (_) => HomeScreen());
      // case 'RegisterPage':
      //  return MaterialPageRoute(builder: (_) => HomeScreen());
      // case 'Forgot Password':
      //  return MaterialPageRoute(builder: (_) => HomeScreen());
       default:
        return _errorPage();
    }
  }
}
 
 Route<dynamic> _errorPage(){
 return MaterialPageRoute(builder: (_) {
return Scaffold(
  appBar: AppBar(
    title: Text('Error'),
  ),
  body:  Center(
    child: Text('Error'),
  ),
);
 });

}