import 'package:flutter/material.dart';

class Decorations {
  static InputDecoration roundedBorderTextField = const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      filled: true,
      fillColor: Colors.white);
}
