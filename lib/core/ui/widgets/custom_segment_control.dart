import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/badge/bloc/badge_bloc.dart';
import '../../../features/point/bloc/point_bloc.dart';
import '../../../features/profile/profile_bloc.dart';
import '../../constants/constants.dart';

enum SegmentType { points, badges }

class CustomSegmentControl extends StatelessWidget {
  const CustomSegmentControl({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      /// Default selected tab is Points
      var currentType = SegmentType.points;

      if (state is SegmentTypeState) {
        currentType = state.type;
      }
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomSlidingSegmentedControl<SegmentType>(
              initialValue: SegmentType.points,
              isStretch: true,
              children: {
                SegmentType.points: Text(
                  Constants.points,
                  textAlign: TextAlign.center,
                  style: getStyle(currentType, SegmentType.points),
                ),
                SegmentType.badges: Text(
                  Constants.badges,
                  textAlign: TextAlign.center,
                  style: getStyle(currentType, SegmentType.badges),
                )
              },
              innerPadding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(24),
              ),
              thumbDecoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              onValueChanged: (v) {
                context.read<ProfileBloc>().add(SegmentChangeEvent(v));
                if (v == SegmentType.badges) {
                  context.read<BadgeBloc>().add(FetchBadgeListEvent());
                } else {
                  context.read<PointBloc>().add(FetchPointListEvent());
                }
              }));
    });
  }

  getStyle(SegmentType currentType, SegmentType type) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color: currentType == type ? Colors.blue : Colors.grey[400]);
  }
}
