import 'dart:async';

import '../../../core/domain/entities/profile.dart';
import '../../../core/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  FutureOr<Profile> fetchProfileInfo(String uId) async {
    await Future.delayed(const Duration(seconds: 3));
    return const Profile(
        fullName: "Victoria Robertson", cleaningHours: 18, image: '');
  }
}
