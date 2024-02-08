part of 'profile_page.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blue,
      expandedHeight: Constants.profileBannerHeight,
      title: Text(
        Constants.home,
        style: TextStyles.subtitleStyle,
      ),
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
            height: 240,
            color: Colors.white,
            child: Stack(
              children: [
                GradiantBackground(
                    end: Alignment.bottomRight,
                    begin: const Alignment(-0.75, -1),
                    colors: AppColors.profileBannerColors,
                    spots: const [
                      0,
                      0.33,
                      0.66,
                      1,
                    ],
                    child: const SizedBox(
                      width: double.infinity,
                      height: 220,
                    )),
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    Constants.profile,
                    style: TextStyles.title1,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: _ProfilePicView(),
                    ),
                  ),
                ])
              ],
            )),
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.goNamed(RouteNames.login);
            },
            child: Text(
              Constants.logout,
              style: TextStyles.subtitleStyle,
            ))
      ],
    );
  }
}

class _ProfilePicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (previous, current) => current is ProfileLoadedState,
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            return CachedNetworkCircleAvatar(
              imageUrl: state.profile.image,
              radius: Constants.avatarRadius,
            );
          } else {
            return const ShimmerCircleAvatar(radius: Constants.avatarRadius);
          }
        });
  }
}
