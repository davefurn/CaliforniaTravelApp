import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp1/login/login_pages/verify_email.dart';

import '../login_widgets/auth_page.dart';



class MainRedirectoryPage extends StatefulWidget {
  const MainRedirectoryPage({Key? key}) : super(key: key);

  @override
  State<MainRedirectoryPage> createState() => _MainRedirectoryPageState();
}

class _MainRedirectoryPageState extends State<MainRedirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffefefe),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasError) {
              return const Center(
                child:  Text('Something went wrong!'),
              );
            } else if (snapshot.hasData) {
              return const VerifyEmailPage();
            } else {
              return const AuthPage();
            }
          },
        ));
  }
}
