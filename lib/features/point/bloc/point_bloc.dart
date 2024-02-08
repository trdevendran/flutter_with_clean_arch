import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/entities/point.dart';
import '../../../core/domain/usecases/point_usecase.dart';

part 'point_event.dart';

part 'point_state.dart';

/// Register all the events of the Point module with the respective emitter to deliver state to the UI layer
/// Widget based business logics represents here
class PointBloc extends Bloc<PointEvent, PointState> {
  final PointUseCase pointUseCase;

  PointBloc(this.pointUseCase) : super(PointListLoadingState()) {
    on<FetchPointListEvent>(_onFetchPointListEvent);
  }

  Future<FutureOr<void>> _onFetchPointListEvent(
      FetchPointListEvent event, Emitter<PointState> emit) async {
    emit(PointListLoadingState());
    List<Point> points = await pointUseCase.fetchPointList("uId");
    emit(PointListLoadedState(points: points));
  }
}
