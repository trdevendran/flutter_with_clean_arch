import 'package:flutter/material.dart';

import '../../core/ui/widgets/custom_switch.dart';
import '../../injections/dependencies.dart';
import 'bloc/remote_bloc.dart';

class WaterSwitch extends StatefulWidget {
  const WaterSwitch({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WaterSwitchState();
  }
}

class _WaterSwitchState extends State<WaterSwitch> {
  final _bloc = sl<RemoteBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _bloc.waterStream,
        initialData: true,
        builder: (context, snapshot) => CustomSwitch(
            value: snapshot.data ?? false,
            onChanged: (value) => _bloc.updateWaterSwitchValue(value)));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.disposeWaterStreamController();
  }
}
