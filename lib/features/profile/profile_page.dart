import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/constants.dart';
import '../../core/ui/styles/app_colors.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/cached_network_circle_avatar.dart';
import '../../core/ui/widgets/custom_segment_control.dart';
import '../../core/ui/widgets/gradiant_background.dart';
import '../../core/ui/widgets/gradient_text.dart';
import '../../core/ui/widgets/shimmer_circle_avatar.dart';
import '../../core/util/router_generator.dart';
import '../../features/badge/list/badge_list_page.dart';
import '../../features/point/list/point_list_page.dart';
import '../../features/profile/profile_bloc.dart';
import '../point/bloc/point_bloc.dart';

part 'appbar_view.dart';

part 'header_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  fetchInfo(BuildContext context) async {
    context.read<ProfileBloc>().add(ProfileLoadingEvent());
    context.read<PointBloc>().add(FetchPointListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchInfo(context),
        builder: (context, snapshot) => Scaffold(

                /// Body used [NestedScrollView] as the page contains sticky header
                /// to ensure the best usability
                body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) =>
                      [const AppBarView()],
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// Sticky header
                    const HeaderView(),
                    BlocBuilder<ProfileBloc, ProfileState>(
                        buildWhen: (previous, current) =>
                            current is SegmentTypeState,
                        builder: (context, state) => Expanded(
                            child: state is SegmentTypeState &&
                                    state.type == SegmentType.badges
                                ? const BadgeListPage()
                                : const PointListPage()))
                  ]),
            )));
  }
}
