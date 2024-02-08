part of 'remote_page.dart';

class SpeedControlsView extends StatelessWidget {
  const SpeedControlsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteBloc, RemoteState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Speed: ${state.speed}",
                style: TextStyles.subtitleStyle,
              )),
          Slider(
              min: 1,
              max: 100,
              value: state.speed.toDouble(),
              onChanged: (double speed) => context
                  .read<RemoteBloc>()
                  .add(SpeedChangeEvent(speed.toInt())))
        ],
      );
    });
  }
}
