import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/landing_screen.dart';
import 'package:recipe_app/auth/login_screen.dart';
import 'package:recipe_app/auth/register_screen.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/screens/bottomnav_screen.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/innerScreens/recipe_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        //
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomnavScreen();
          } else {
            return const LandingScreen();
          }
        },
      ),

      // route
      routes: {
        RecipeScreen.routeName: (ctx) => const RecipeScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
    );
  }
}
