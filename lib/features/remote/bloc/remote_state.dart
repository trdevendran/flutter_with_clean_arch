part of 'remote_bloc.dart';

class RemoteState extends Equatable {
  final int speed;
  final bool canStop;
  final bool waterEnabled;
  final bool brushEnabled;

  const RemoteState(
      {this.waterEnabled = false,
      this.brushEnabled = false,
      required this.speed,
      this.canStop = false});

  RemoteState copyWith(
      {bool? canStop, int? speed, bool? waterEnabled, bool? brushEnabled}) {
    return RemoteState(
        speed: speed ?? this.speed,
        canStop: canStop ?? this.canStop,
        waterEnabled: waterEnabled ?? this.waterEnabled,
        brushEnabled: brushEnabled ?? this.brushEnabled);
  }

  @override
  List<Object?> get props => [speed, canStop, waterEnabled, brushEnabled];
}
