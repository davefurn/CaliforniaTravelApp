import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../login_components_ui/login_button.dart';
import '../login_components_ui/login_button2.dart';
import '../login_components_ui/login_field_password.dart';
import '../login_components_ui/login_fiels.dart';
import '../login_widgets/scroll_behaviour.dart';
import '../login_widgets/utils.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({Key? key, required this.onClickedSignUp})
      : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/3907317.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('HomeScreen');
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
                      'Login',
                      style: TextStyle(
                        color: Color(0xff0b162b),
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.left,
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
                      child: Material(
                          elevation: 0.4,
                          child: Component11(
                            icon: Icons.lock_clock_outlined,
                            hintText: 'Password',
                            isPassWord: true,
                            isEmail: false,
                            controller: passwordController,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 50.5,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('ForgotPassword');
                      },
                      child: const Text(
                        'Forgot Password?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color.fromARGB(255, 42, 108, 207),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                      child: Component2(
                          string: 'Login', width: 1.2, voidCallback: signIn)),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 30.5, top: 10, bottom: 10, right: 50.5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'OR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff898a8e),
                          fontWeight: FontWeight.w500),
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
                      child: Component22(
                          string: 'Login with Google',
                          width: 1.2,
                          voidCallback: () {},
                          icon: Image.network(
                              'http://pngimg.com/uploads/google/google_PNG19635.png'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.5, top: 10, bottom: 10, right: 50.5),
                  child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            color: Color(0xff898a8e),
                            fontSize: 12,
                          ),
                          text: 'New to KillDBug?   ',
                          children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
                          text: 'Register',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 42, 108, 207),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ])),
                ),
              ],
            ),
          ),
        ),
      );
  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
