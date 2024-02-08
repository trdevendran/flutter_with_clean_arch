import 'dart:async';

import '../domain/entities/badge.dart';

abstract class BadgeRepository {
  FutureOr<List<Badge>> fetchBadgeList(String uId);
}
