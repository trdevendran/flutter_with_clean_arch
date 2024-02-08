import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';

class CustomPasswordField extends StatefulWidget {
  final String hint;
  final void Function(String text) onChanged;

  const CustomPasswordField({
    super.key,
    this.hint = '',
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomPasswordField();
  }
}

class _CustomPasswordField extends State<CustomPasswordField> {
  bool obscureText = true;

  _CustomPasswordField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
          suffix: TextButton(
              onPressed: () => setState(() {
                    obscureText = !obscureText;
                  }),
              child: Text(
                obscureText ? "Show" : "Hide",
                style: TextStyles.passwordTypeHintStyle,
              )),
          hintStyle: TextStyles.hintTextStyle),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
