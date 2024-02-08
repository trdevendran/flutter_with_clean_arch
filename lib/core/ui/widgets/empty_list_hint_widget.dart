import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/constants.dart';

class EmptyListHintWidget extends StatelessWidget {
  final String message;

  const EmptyListHintWidget(
      {super.key,
      this.message = Constants.titleNoRecordFound});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
