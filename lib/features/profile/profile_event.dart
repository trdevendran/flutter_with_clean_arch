part of 'profile_bloc.dart';

class ProfileEvent {}

class ProfileLoadingEvent extends ProfileEvent {}

class SegmentChangeEvent extends ProfileEvent {
  final SegmentType type;

  SegmentChangeEvent(this.type);
}
