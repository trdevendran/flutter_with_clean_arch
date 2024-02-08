import 'dart:async';

import '../../repositories/badge_repository.dart';
import '../entities/badge.dart';

class BadgeUseCase {
  final BadgeRepository repository;

  BadgeUseCase(this.repository);

  FutureOr<List<Badge>> fetchBadgeList(String uId) {
    return repository.fetchBadgeList(uId);
  }
}
