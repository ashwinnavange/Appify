import 'package:flutter/material.dart';

import '../utils/screen_size.dart';

class UnAuthorizedView extends StatelessWidget {
  const UnAuthorizedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.h * 0.8,
      child: const Center(
        child: Text(
          'You are not authorized to view this page. Please login to continue.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
