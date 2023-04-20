import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/register_screen.dart';
// import 'package:recipe_app/components/error_widget.dart';
import 'package:recipe_app/components/text_field.dart';
import 'package:recipe_app/components/text_widget.dart';
// import 'package:recipe_app/screens/bottomnav_screen.dart';
import 'package:recipe_app/services/firebase_auth.dart';
import 'package:recipe_app/services/global_methods.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginWithEmail() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/auth/landing.jpg'),
            alignment: Alignment.center,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.lock_outline_rounded,
                size: 80,
                color: Colors.white70,
              ),
              const SizedBox(
                height: 30,
              ),
              TextWidget(
                color: Colors.grey.shade700,
                textSize: 22,
                text: 'Welcome Back Chef',
              ),
              const SizedBox(
                height: 20,
              ),
              // username textField
              TextInputsField(
                keyboard: TextInputType.emailAddress,
                controller: emailController,
                hintText: 'Enter your email',
                obscureText: false,
                icon: const Icon(Icons.email_outlined),
              ),

              const SizedBox(
                height: 10,
              ),
              TextInputsField(
                keyboard: TextInputType.visiblePassword,
                controller: passwordController,
                hintText: 'Enter your Password',
                obscureText: true,
                icon: const Icon(Icons.lock_outlined),
              ),
              const SizedBox(
                height: 20,
              ),

              // Login button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(20),
                  ),
                  onPressed: loginWithEmail,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextWidget(
                        color: Colors.white, textSize: 22, text: "Login"),
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
                    onPressed: () {
                      FirebaseAuthMethods(FirebaseAuth.instance)
                          .signInWithGoogle(context);
                    },
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
                      text: "Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                        ctx: context,
                        routeName: RegisterScreen.routeName,
                      );
                    },
                    child: TextWidget(
                      color: Colors.blue,
                      textSize: 18,
                      text: " Register here",
                      isTitle: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
