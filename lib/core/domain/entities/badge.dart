import 'package:equatable/equatable.dart';

class Badge extends Equatable {
  final String name;
  final String description;

  const Badge(this.name, this.description);

  @override
  List<Object?> get props => [name, description];
}
