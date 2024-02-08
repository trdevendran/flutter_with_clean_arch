import 'dart:async';

import '../domain/entities/profile.dart';

abstract class ProfileRepository {
  FutureOr<Profile> fetchProfileInfo(String uId);
}
