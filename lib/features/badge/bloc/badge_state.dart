part of 'badge_bloc.dart';

class BadgeState extends Equatable {
  const BadgeState();

  @override
  List<Object?> get props => [];
}

class BadgeListLoadingState extends BadgeState {
  const BadgeListLoadingState();

  @override
  List<Object?> get props => [];
}

class BadgeListLoadedState extends BadgeState {
  final List<Badge> badges;

  const BadgeListLoadedState({required this.badges});

  @override
  List<Object?> get props => [];
}
