import 'package:flutter/material.dart';

import '../../util/constants.dart';

class DBrandName extends StatelessWidget {
  const DBrandName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      TTexts.dBlog,
      style: TextStyle(
        color: Color(0xFF093D9F),
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}