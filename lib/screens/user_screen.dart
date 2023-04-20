import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth/login_screen.dart';
import 'package:recipe_app/components/text_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hello, ',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'You name',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // print('my name');
                              },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        print('name');
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 32,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/id/237/200/300'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'email@gmail.com',
                  color: Colors.blue.shade400,
                  textSize: 16,
                  // isTitle: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                  ),
                  child: ListTile(
                    selected: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                    title: TextWidget(
                      text: "title",
                      color: Colors.black,
                      textSize: 21,
                      // isTitle: true,
                    ),
                    leading: const Icon(Icons.login_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      });
                    },
                  ),
                ),
                ListTiles(
                  title: "Sign Up",
                  icon: Icons.abc_sharp,
                  onPressed: () {
                    print('blue');
                  },
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _logoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: Row(
            children: const [
              Icon(Icons.logout_outlined),
              SizedBox(
                width: 10,
              ),
              Text("Sign out"),
            ],
          ),
          content: const Text("Do you want to sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                text: "cancel",
                color: Colors.cyan,
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                });
              },
              child: TextWidget(
                text: "Ok",
                color: Colors.red,
                textSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
      ),
      child: ListTile(
        selected: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        title: TextWidget(
          text: title,
          color: color,
          textSize: 21,
          // isTitle: true,
        ),
        leading: Icon(icon),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {},
      ),
    );
  }
}
