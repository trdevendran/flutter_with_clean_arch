part of 'remote_bloc.dart';

class RemoteEvent {
  const RemoteEvent();
}

class SpeedChangeEvent extends RemoteEvent {
  final int speed;

  SpeedChangeEvent(this.speed);
}

class ToggleTriggerButtonEvent extends RemoteEvent {
  const ToggleTriggerButtonEvent();
}

class EnableWaterEvent extends RemoteEvent {
  const EnableWaterEvent();
}

class EnableBrushEvent extends RemoteEvent {
  const EnableBrushEvent();
}

class GoToSettingsEvent extends RemoteEvent {
  const GoToSettingsEvent();
}
