part of 'remote_page.dart';

class TriggerButton extends StatelessWidget {
  const TriggerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteBloc, RemoteState>(
        builder: (context, state) => ElevatedButton(
              style: state.canStop
                  ? ButtonStyles.stopButton
                  : ButtonStyles.startButton,
              onPressed: () {
                context
                    .read<RemoteBloc>()
                    .add(const ToggleTriggerButtonEvent());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  state.canStop ? "STOP" : "START",
                  style: TextStyles.largeTitle2,
                ),
              ),
            ));
  }
}
