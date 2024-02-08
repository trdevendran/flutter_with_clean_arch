import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/custom_circular_progress_indicator.dart';
import '../../../core/ui/widgets/empty_list_hint_widget.dart';
import '../../../core/ui/widgets/shimmer_card.dart';
import '../bloc/badge_bloc.dart';

class BadgeListPage extends StatelessWidget {
  const BadgeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BadgeBloc, BadgeState>(builder: (context, state) {
      if (state is BadgeListLoadedState) {
        if (state.badges.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var badge = state.badges[index];
              return ListTile(
                leading: const ShimmerCard(
                  width: 50.0,
                  height: 60.0,
                ),
                title: Text(badge.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.titleBlack1),
                subtitle: Column(
                  children: [
                    Text(badge.description,
                        style: TextStyles.subtitleStyleBlack1),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider()
                  ],
                ),
              );
            },
            itemCount: state.badges.length,
          );
        } else {
          return const EmptyListHintWidget();
        }
      } else {
        return const CustomCircularProgressIndicator();
      }
    });
  }
}
