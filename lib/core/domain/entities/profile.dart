import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String fullName;
  final double cleaningHours;
  final String image;

  const Profile(
      {required this.fullName,
      required this.image,
      required this.cleaningHours});

  @override
  List<Object?> get props => [fullName, image, cleaningHours];
}
