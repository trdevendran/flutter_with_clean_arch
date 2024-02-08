import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final void Function(bool value) onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return _CustomSwitch();
  }
}

class _CustomSwitch extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.transparent,
        inactiveThumbColor: Colors.white,
        trackOutlineColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white.withOpacity(0.5);
          }
          return Colors.white70;
        }),
        value: widget.value,
        onChanged: widget.onChanged);
  }
}
