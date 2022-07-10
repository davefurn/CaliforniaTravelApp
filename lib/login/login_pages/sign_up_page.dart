import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../login_components_ui/login_button.dart';
import '../login_components_ui/login_field_password.dart';
import '../login_components_ui/login_field_username.dart';
import '../login_components_ui/login_fiels.dart';
import '../login_widgets/scroll_behaviour.dart';
import '../login_widgets/utils.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUpWidget({Key? key, required this.onClickedSignIn})
      : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
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
                              image: AssetImage('assets/images/19199299.jpg'),
                              fit: BoxFit.fill)),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop('HomeScreen');
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
                        'Sign up',
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
                            child: Component12(
                              icon: Icons.person,
                              hintText: 'Username',
                              isPassWord: false,
                              isEmail: false,
                              controller: usernameController,
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
                              icon: Icons.verified_user_outlined,
                              hintText: 'Password',
                              isPassWord: true,
                              isEmail: false,
                              controller: passwordController,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50.5, top: 10, bottom: 10, left: 17.5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          const Text(
                            'By signing up, you agree to our ',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Color(0xff898a8e),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              ' Terms & Condition and Privacy Policy',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Color.fromARGB(255, 42, 108, 207),
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
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
                            string: 'Continue',
                            width: 1.2,
                            voidCallback: signUp)),
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
                            text: ' Joined KillDBug before?   ',
                            children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignIn,
                            text: 'Log In',
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
        ),
      );

  Future signUp() async {
    try {
      final isValid = formkey.currentState!.validate();
      if (!isValid) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
