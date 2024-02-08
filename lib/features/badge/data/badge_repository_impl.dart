import 'dart:async';

import '../../../core/domain/entities/badge.dart';
import '../../../core/repositories/badge_repository.dart';

class BadgeRepositoryImpl implements BadgeRepository {
  @override
  FutureOr<List<Badge>> fetchBadgeList(String uId) async {
    await Future.delayed(const Duration(seconds: 3));
    return [];
  }
}
