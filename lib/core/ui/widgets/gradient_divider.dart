import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white.withOpacity(0.1),
        Colors.white.withOpacity(0.8),
        Colors.white.withOpacity(0.1)
      ])),
    );
  }
}
