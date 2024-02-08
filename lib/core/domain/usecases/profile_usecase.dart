import 'dart:async';

import '../../repositories/profile_repository.dart';
import '../entities/profile.dart';

class ProfileUseCase {
  final ProfileRepository repository;

  ProfileUseCase(this.repository);

  FutureOr<Profile> getProfileInfo(String uId) {
    return repository.fetchProfileInfo(uId);
  }
}
