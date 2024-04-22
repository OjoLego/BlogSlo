import 'package:flutter/material.dart';

import 'd_sub_text.dart';

class DMulticoloredString extends StatelessWidget {
  const DMulticoloredString({
    super.key,
    required this.text1,
    required this.text2,
    required this.onText1Pressed,
    required this.onText2Pressed,
  });

  final String text1;
  final String text2;
  final VoidCallback onText1Pressed;
  final VoidCallback onText2Pressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onText1Pressed,
          child: DSubText(
            subHeading: text1,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: onText2Pressed,
          child: Text(
            text2,
            style: const TextStyle(
              color: Color(0xFF093D9F),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
