import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/ui/widgets/retry_action_widget.dart';

import '/core/constants/constants.dart';
import '/core/ui/styles/text_styles.dart';
import '/core/ui/widgets/custom_circular_progress_indicator.dart';
import '/core/ui/widgets/empty_list_hint_widget.dart';
import '/core/ui/widgets/shimmer_card.dart';
import '../bloc/point_bloc.dart';

class PointListPage extends StatelessWidget {
  const PointListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointBloc, PointState>(builder: (context, state) {
      if (state is PointListLoadedState) {
        if (state.points.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var point = state.points[index];
              return ListTile(
                leading: const ShimmerCard(
                  width: 50.0,
                  height: 60.0,
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(point.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyles.titleBlack1),
                    Flexible(
                        child: Text(point.time, style: TextStyles.timeAgoStyle))
                  ],
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(point.description,
                                style: TextStyles.subtitleStyleBlack1))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider()
                  ],
                ),
              );
            },
            itemCount: state.points.length,
          );
        } else {
          return const EmptyListHintWidget();
        }
      } else if (state is PointListLoadingState) {
        return const CustomCircularProgressIndicator();
      } else {
        return RetryActionWidget(
            buttonTitle: Constants.actionFailedError,
            placeholderMessage: Constants.actionFailedError,
            onPressed: () =>
                context.read<PointBloc>().add(FetchPointListEvent()));
      }
    });
  }
}
