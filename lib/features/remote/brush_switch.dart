import 'package:flutter/material.dart';

import '../../core/ui/widgets/custom_switch.dart';
import '../../injections/dependencies.dart';
import 'bloc/remote_bloc.dart';

class BrushSwitch extends StatefulWidget {
  final bool value;

  const BrushSwitch({super.key, required this.value});

  @override
  State<StatefulWidget> createState() {
    return _BrushSwitchState();
  }
}

class _BrushSwitchState extends State<BrushSwitch> {
  final _bloc = sl<RemoteBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _bloc.brushStream,
        initialData: false,
        builder: (context, snapshot) => CustomSwitch(
            value: snapshot.data ?? false,
            onChanged: (value) {
              _bloc.updateBrushSwitchValue(value);
            }));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.disposeBrushStreamController();
  }
}
