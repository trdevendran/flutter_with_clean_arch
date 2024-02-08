import 'package:equatable/equatable.dart';

class Point extends Equatable {
  final String name;
  final String description;
  final String imageUrl;
  final String time;

  const Point(this.name, this.description, this.imageUrl, this.time);

  @override
  List<Object?> get props => [name, description, imageUrl, time];
}
