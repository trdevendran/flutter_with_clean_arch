import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'remote_event.dart';

part 'remote_state.dart';

class RemoteBloc extends Bloc<RemoteEvent, RemoteState> {
  final _waterStreamController = StreamController<bool>();
  final _brushStreamController = StreamController<bool>();

  Stream<bool> get waterStream => _waterStreamController.stream;

  Stream<bool> get brushStream => _brushStreamController.stream;

  RemoteBloc() : super(const RemoteState(speed: 20)) {
    on<ToggleTriggerButtonEvent>(_onToggleTriggerButtonEvent);
    on<SpeedChangeEvent>(_onSpeedChangeEvent);
  }

  void disposeWaterStreamController() {
    _waterStreamController.close();
  }

  void disposeBrushStreamController() {
    _brushStreamController.close();
  }

  FutureOr<void> _onToggleTriggerButtonEvent(
      ToggleTriggerButtonEvent event, Emitter<RemoteState> emit) {
    emit(state.copyWith(canStop: !state.canStop));
  }

  FutureOr<void> _onSpeedChangeEvent(
      SpeedChangeEvent event, Emitter<RemoteState> emit) {
    emit(state.copyWith(speed: event.speed));
  }

  updateWaterSwitchValue(bool value) {
    _waterStreamController.add(value);
  }

  updateBrushSwitchValue(bool value) {
    _brushStreamController.add(value);
  }
}
