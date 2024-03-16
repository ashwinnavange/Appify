import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final double width;

  const CommonButton({
    Key? key,
    this.isLoading = false,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
        ),
        child: Text(title, style: TextStyle(color: textColor, fontSize: 18)),
      ),
    );
  }
}
