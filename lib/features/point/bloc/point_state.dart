part of 'point_bloc.dart';

class PointState extends Equatable {
  const PointState();

  @override
  List<Object?> get props => [];
}

class PointListLoadingState extends PointState {}

class PointListLoadedState extends PointState {
  final List<Point> points;

  const PointListLoadedState({required this.points});
}
