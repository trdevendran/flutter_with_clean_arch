import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/remote/remote_page.dart';
import '../../features/auth/login_page.dart';
import '../../features/home/home_page.dart';

class RouterGenerator {
  static GoRouter routerGenerator() => GoRouter(
          initialLocation: Routes.home,
          // redirect: (state) {LoggedInStateInfo loggedInStateInfo
          //   final isOnLogin = state.location
          // },
          // refreshListenable: ,
          routes: <RouteBase>[
            GoRoute(
                path: "/",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage()),
            GoRoute(
                name: RouteNames.login,
                path: Routes.login,
                builder: (BuildContext context, GoRouterState state) =>
                    const LoginPage()),
            GoRoute(
                name: RouteNames.home,
                path: Routes.home,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage()),
            GoRoute(
                name: RouteNames.remote,
                path: Routes.remote,
                builder: (BuildContext context, GoRouterState state) =>
                    const RemotePage())
          ]);
}

abstract class Routes {
  static const home = "/home";
  static const remote = "/remote";
  static const login = "/login";
}

abstract class RouteNames {
  static const home = "home";
  static const remote = "remote";
  static const login = "login";
}
