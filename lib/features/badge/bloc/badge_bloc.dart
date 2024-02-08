import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/entities/badge.dart';
import '../../../core/domain/usecases/badge_usecase.dart';
import '../../point/bloc/point_bloc.dart';

part 'badge_event.dart';
part 'badge_state.dart';

class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
  final BadgeUseCase badgeUseCase;

  BadgeBloc(this.badgeUseCase) : super(const BadgeListLoadingState()){
    on<FetchBadgeListEvent>(_onFetchBadgeListEvent);
  }

  Future<FutureOr<void>> _onFetchBadgeListEvent(FetchBadgeListEvent event, Emitter<BadgeState> emit) async {
    emit(BadgeListLoadingState());
    List<Badge> badges = await badgeUseCase.fetchBadgeList("uId");
    emit(BadgeListLoadedState(badges: badges));
  }
}
