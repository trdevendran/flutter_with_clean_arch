import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/features/remote/remote_page.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/constants.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/swipe_indicator.dart';

class BottomSheetContent extends StatelessWidget {
  final bool expand;

  const BottomSheetContent({super.key, required this.expand});

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    if (expand) {
      children.add(SwipeIndicator(
        onTap: () {
          if (expand) {
            context.pop();
          } else {
            showModalBottomSheet(
                context: context,
                builder: (context) => const BottomSheetContent(expand: true),
                isScrollControlled: true);
          }
        },
      ));
    }
    children.add(Column(
      children: [
        const Icon(Icons.settings_outlined, color: Colors.white),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            Constants.settings,
            style: TextStyles.subtitleStyle,
          ),
        )
      ],
    ));
    if (expand) {
      children.add(const SpeedControlsView());
    }
    return SizedBox(
        width: double.infinity,
        height: expand ? 210 : 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ));
  }
}
