part of 'remote_page.dart';

class RemoteSwitchesView extends StatelessWidget {
  const RemoteSwitchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GradientDivider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.water_drop_outlined,
            color: Colors.white,
          ),
          getMinorSpace(),
          Text(
            "WATER",
            style: TextStyles.subtitleStyle,
          ),
          getMinorSpace(width: 4),
          const WaterSwitch(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Container(
              width: 1,
              height: 50,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          const Icon(
            Icons.ac_unit,
            color: Colors.white,
          ),
          getMinorSpace(),
          Text(
            "BRUSH",
            style: TextStyles.subtitleStyle,
          ),
          getMinorSpace(width: 4),
          const BrushSwitch(
            value: false,
          ),
        ],
      ),
      GradientDivider(),
    ]);
  }

  getMinorSpace({double width = 2}) {
    return SizedBox(
      width: width,
    );
  }
}
