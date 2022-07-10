import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../login_components_ui/login_button.dart';
import '../login_components_ui/login_fiels.dart';
import '../login_widgets/scroll_behaviour.dart';
import '../login_widgets/utils.dart';

class ForgotPassWordPage extends StatefulWidget {
  const ForgotPassWordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassWordPage> createState() => _ForgotPassWordPageState();
}

class _ForgotPassWordPageState extends State<ForgotPassWordPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: MyBehaviour(),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/4498897.jpg'),
                                fit: BoxFit.fill)),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomeScreen');
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff898a8e),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.5,
                        top: 10,
                        bottom: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          'Forgot\nPassword?',
                          style: TextStyle(
                            color: Color(0xff0b162b),
                            fontWeight: FontWeight.w500,
                            fontSize: 40,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          right: 50.5, top: 10, bottom: 10, left: 30.5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Don't worry, it happens! Please enter the address associated with your account ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xff898a8e),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.5,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                              elevation: 0.4,
                              child: Component1(
                                icon: Icons.email_outlined,
                                hintText: 'Email ID',
                                isPassWord: false,
                                isEmail: true,
                                controller: emailController,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.5,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Component222(
                              string: 'Reset PassWord',
                              width: 1.2,
                              voidCallback: resetPassword)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Color(0xffff735c),
        ),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('Password Reset Email Sent');

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
