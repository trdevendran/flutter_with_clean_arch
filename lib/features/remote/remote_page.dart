import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_joystick_customisable/flutter_joystick_customisable.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/constants.dart';
import '../../core/ui/styles/button_styles.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/gradiant_background.dart';
import '../../core/ui/widgets/gradient_divider.dart';
import '../../features/remote/bottom_sheet_content.dart';
import '../../features/remote/brush_switch.dart';
import '../../features/remote/water_switch.dart';
import 'bloc/remote_bloc.dart';

part 'speed_slider.dart';

part 'switches_view.dart';

part 'trigger_button.dart';

/// Displays the controls of the remote
class RemotePage extends StatefulWidget {
  const RemotePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RemotePageState();
  }
}

class _RemotePageState extends State<RemotePage> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(seconds: 300);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bodyTopMargin = AppBar().preferredSize.height + 16;
    return BlocBuilder<RemoteBloc, RemoteState>(builder: (context, state) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            Constants.remoteControl,
            style: TextStyles.title1,
          ),
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          backgroundColor: Colors.transparent,
        ),
        body: GradiantBackground(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: const [
              Colors.pink,
              Colors.purple,
              Colors.blue,
              Colors.white,
            ],
            spots: const [0, 0.2, 0.6, 0.8],
            child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    SizedBox(
                      height: bodyTopMargin,
                    ),
                    const RemoteSwitchesView(),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Joystick(
                                  enableButtonControls: true,
                                  stickSize: 100,
                                  dragCallback: (DragInfo dragInfo) {},
                                ),
                                const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(child: TriggerButton())
                                    ])
                              ],
                            ))),

                    /// To avoid overlapping with content of the bottom sheet
                    const SizedBox(
                      height: 150,
                    )
                  ],
                ))),
        bottomSheet: BottomSheet(
          enableDrag: true,
          dragHandleColor: Colors.white,
          showDragHandle: true,
          animationController: controller,
          onDragStart: (details) {
            showModalBottomSheet(
                context: context,
                builder: (context) => const BottomSheetContent(expand: true),
                isScrollControlled: true);
          },
          builder: (context) => const BottomSheetContent(expand: false),
          onClosing: () {},
        ),
      );
    });
  }
}
