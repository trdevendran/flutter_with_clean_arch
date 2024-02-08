import 'dart:async';

import '../domain/entities/point.dart';

abstract class PointRepository {
  Future<List<Point>> fetchPointList(String uId);
}
