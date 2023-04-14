// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.color,
    required this.textSize,
    required this.text,
    this.isTitle = false,
    this.maxLines = 10,
    this.family = 'Overpass',
  });

  final String text;
  final Color color;
  final double textSize;
  final String family;
  int maxLines = 10;
  bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: textSize,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        fontFamily: family,
      ),
    );
  }
}
