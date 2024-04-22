import 'package:flutter/material.dart';

class DSubText extends StatelessWidget {
  const DSubText({
    super.key,
    required this.subHeading,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
    this.color = const Color(0xFF4B5563),
  });

  final String subHeading;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      subHeading,
      style: TextStyle(
        color: const Color(0xFF4B5563),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}
