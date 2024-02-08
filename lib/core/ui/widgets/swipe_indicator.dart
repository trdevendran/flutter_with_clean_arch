import 'package:flutter/material.dart';

class SwipeIndicator extends StatelessWidget {
  final void Function() onTap;

  const SwipeIndicator({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  const EdgeInsets.all( 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(2)),
          width: 32,
          height: 4,
        ),
      ),
    );
  }
}
