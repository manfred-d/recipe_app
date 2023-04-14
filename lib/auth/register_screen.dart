import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/login_screen.dart';
import 'package:recipe_app/components/text_field.dart';
import 'package:recipe_app/components/text_widget.dart';
import 'package:recipe_app/screens/bottomnav_screen.dart';
import 'package:recipe_app/services/global_methods.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  RegisterScreen({super.key});

  // text editing controller
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.yellowAccent,
            Colors.brown,
            Colors.green,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Icon(
                    Icons.lock_outline_rounded,
                    size: 50,
                    color: Colors.white54,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextWidget(
                    color: Colors.grey.shade700,
                    textSize: 22,
                    text: 'Welcome, Register Here',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // username textField
                  TextInputsField(
                    keyboard: TextInputType.name,
                    controller: widget.usernameController,
                    hintText: 'Enter your Username',
                    obscureText: false,
                    icon: const Icon(Icons.person_2_outlined),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // email text
                  TextInputsField(
                    keyboard: TextInputType.emailAddress,
                    controller: widget.emailController,
                    hintText: 'Enter your email',
                    obscureText: false,
                    icon: const Icon(Icons.email_outlined),
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Email is required";
                      }
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  TextInputsField(
                    keyboard: TextInputType.visiblePassword,
                    controller: widget.passwordController,
                    hintText: 'Enter your Password',
                    obscureText: true,
                    icon: const Icon(Icons.lock_outlined),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // Register button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size.fromHeight(20),
                      ),
                      // on click sign in
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: widget.emailController.text,
                            password: widget.passwordController.text,
                          )
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomnavScreen(),
                              ),
                            );
                          });
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('weak password');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already in use');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextWidget(
                            color: Colors.white,
                            textSize: 22,
                            text: "Register"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[500],
                            thickness: 0.5,
                          ),
                        ),
                        const Text(
                          'Or sign Up with',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[500],
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(5.0),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/auth/google.png',
                            height: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                          color: Colors.white,
                          textSize: 16,
                          text: "Have an account?"),
                      TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(
                            ctx: context,
                            routeName: LoginScreen.routeName,
                          );
                        },
                        child: TextWidget(
                          color: Colors.blue,
                          textSize: 18,
                          text: " Login here",
                          isTitle: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
