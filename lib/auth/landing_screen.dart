import 'package:flutter/material.dart';
import 'package:recipe_app/auth/login_screen.dart';
import 'package:recipe_app/auth/register_screen.dart';
import 'package:recipe_app/services/global_methods.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/auth/landing.jpg'),
            alignment: Alignment.center,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 600,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[400],
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  GlobalMethods.navigateTo(
                    ctx: context,
                    routeName: LoginScreen.routeName,
                  );
                },
                child: const Text(
                  'Login Here',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[400],
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  GlobalMethods.navigateTo(
                    ctx: context,
                    routeName: RegisterScreen.routeName,
                  );
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
