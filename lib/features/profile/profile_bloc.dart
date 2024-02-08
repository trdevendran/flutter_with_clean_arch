import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/domain/entities/profile.dart';
import '../../core/domain/usecases/profile_usecase.dart';
import '../../core/ui/widgets/custom_segment_control.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileBloc(this.profileUseCase) : super(const ProfileState()) {
    on<ProfileLoadingEvent>(_onProfileLoadingEvent);
    on<SegmentChangeEvent>(_onSegmentChangeEvent);
  }

  Future<FutureOr<void>> _onProfileLoadingEvent(
      ProfileLoadingEvent event, Emitter<ProfileState> emit) async {
    emit(const ProfileLoadingState());
    emit(const SegmentTypeState(SegmentType.points));
    var profile = await profileUseCase.getProfileInfo("uId");
    emit(ProfileLoadedState(profile: profile));
  }

  FutureOr<void> _onSegmentChangeEvent(
      SegmentChangeEvent event, Emitter<ProfileState> emit) {
    emit(SegmentTypeState(event.type));
  }
}
