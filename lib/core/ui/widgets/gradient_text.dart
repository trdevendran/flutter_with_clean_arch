import 'package:flutter/material.dart';

/// It makes a text widget with a linear gradient format based on provided color array
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final List<Color> colors;

  const GradientText(this.text,
      {super.key, this.style = const TextStyle(), required this.colors});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
            .createShader(rect);
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
