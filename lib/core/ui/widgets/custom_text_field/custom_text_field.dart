import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/features/auth/auth_bloc.dart';

import '../../styles/text_styles.dart';
import 'custom_password_field.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final String hint;
  final TextInputType type;
  final void Function(String text) onChanged;

  const CustomTextField(
      {super.key,
      this.hint = '',
      this.type = TextInputType.none,
      this.obscureText = false,
      required this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return _CustomTextField();
  }
}

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3))
          ]),
      child: Padding(
        padding: TextInputType.visiblePassword == widget.type
            ? const EdgeInsets.symmetric(horizontal: 8)
            : const EdgeInsets.all(8),
        child: TextInputType.visiblePassword == widget.type
            ? CustomPasswordField(
                hint: widget.hint,
                onChanged: widget.onChanged,
              )
            : TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hint,
                    hintStyle: TextStyles.hintTextStyle),
                keyboardType: widget.type,
                onChanged: widget.onChanged,
              ),
      ),
    );
  }
}
