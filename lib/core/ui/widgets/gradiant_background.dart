import 'package:flutter/material.dart';

class GradiantBackground extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final List<double>? spots;
  final Alignment begin;
  final Alignment end;

  const GradiantBackground(
      {super.key,
      required this.child,
      this.colors = const [],
      this.spots,
      this.begin = Alignment.topRight,
      this.end = Alignment.bottomLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors, stops: spots, begin: begin, end: end)),
        child: child);
  }
}
