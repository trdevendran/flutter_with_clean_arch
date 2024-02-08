import 'dart:async';

import '../../repositories/point_repository.dart';
import '../entities/point.dart';

class PointUseCase {
  final PointRepository repository;

  PointUseCase(this.repository);

  Future<List<Point>> fetchPointList(String uId) {
    return repository.fetchPointList(uId);
  }
}
