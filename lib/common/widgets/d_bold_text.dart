import 'package:flutter/material.dart';

class DBoldText extends StatelessWidget {
  const DBoldText({
    super.key, required this.heading, required this.fontSize, required this.fontWeight,
  });

  final String heading;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextStyle(
        color: const Color(0xFF111827),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}