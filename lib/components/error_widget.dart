// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_widget.dart';

Future<void> myErrorMessage(BuildContext context, String error) async {
  await showDialog(
    context: context,
    builder: (context) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pop();
      });

      return AlertDialog(
        backgroundColor: Colors.redAccent,
        titlePadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
        contentPadding: const EdgeInsets.only(bottom: 10, left: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.white,
              size: 28,
            ),
            TextWidget(
                color: Colors.white, textSize: 16, text: 'Error Occurred'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
        content: TextWidget(
          color: Colors.white,
          textSize: 18,
          text: error.toString(),
        ),
      );
    },
  );
}
