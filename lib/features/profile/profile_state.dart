part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class SegmentTypeState extends ProfileState {
  final SegmentType type;

  const SegmentTypeState(this.type);

  @override
  List<Object?> get props => [type];
}

class ProfileLoadedState extends ProfileState {
  final Profile profile;

  const ProfileLoadedState({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState() : super();
}
