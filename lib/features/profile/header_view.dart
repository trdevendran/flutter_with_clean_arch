part of 'profile_page.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (previous, current) =>
            current is ProfileLoadedState && previous != current,
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: GradientText(
                      state.profile.fullName,
                      colors: AppColors.profileNameColors,
                      style: TextStyles.largeTitle1,
                    )),
                Text(
                  "Cleaning Hours: ${state.profile.cleaningHours}",
                  style: TextStyles.profileCleaningHoursStyle,
                ),
                const SizedBox(height: 16),
                const CustomSegmentControl(),
              ],
            );
          } else {
            return const SizedBox(height: 100);
          }
        });
  }
}
