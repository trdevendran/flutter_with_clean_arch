import 'dart:async';

import '../../../core/domain/entities/point.dart';
import '../../../core/repositories/point_repository.dart';
import 'package:timeago/timeago.dart' as time_ago;

class PointRepositoryImpl implements PointRepository {
  @override
  Future<List<Point>> fetchPointList(String uId) async {
    var locale = 'en_short';

    await Future.delayed(const Duration(seconds: 3));
    List<Point> list = <Point>[];
    list.add(Point(
        "Successful Operation",
        "+10 Points. Successfully operated the robots without any issues.",
        "",
        time_ago.format(DateTime.timestamp(), locale: locale)));
    list.add(Point(
        "Cleaning Spree",
        "+50 Points for using the robot daily",
        "",
        time_ago.format(
            DateTime.timestamp().subtract(const Duration(minutes: 5)),
            locale: locale)));
    list.add(Point(
        "Welcome Reward",
        "+20 Points to kikstart your journey",
        "",
        time_ago.format(
            DateTime.timestamp().subtract(const Duration(minutes: 30)),
            locale: locale)));
    list.add(Point(
        "Successful Operation",
        "+10 Points. Successfully operated the robots without any issues.",
        "",
        time_ago.format(DateTime.timestamp().subtract(const Duration(hours: 1)),
            locale: locale)));
    list.add(Point(
        "Cleaning Spree",
        "+50 Points for using the robot daily",
        "",
        time_ago.format(DateTime.timestamp().subtract(const Duration(hours: 5)),
            locale: locale)));
    list.add(Point(
        "Welcome Reward",
        "+20 Points to kikstart your journey",
        "",
        time_ago.format(
            DateTime.timestamp().subtract(const Duration(hours: 30)),
            locale: locale)));
    return list;
  }
}
