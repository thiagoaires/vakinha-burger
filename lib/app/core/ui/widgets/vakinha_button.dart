import 'package:flutter/material.dart';

class VakinhaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double height;
  final Color? color;

  const VakinhaButton({
    super.key,
    this.onPressed,
    required this.label,
    this.width,
    this.height = 50,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
