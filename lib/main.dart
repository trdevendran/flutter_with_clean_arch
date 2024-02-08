import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/ui/styles/app_colors.dart';
import 'core/util/color_helper.dart';
import 'features/badge/bloc/badge_bloc.dart';
import 'features/message/bloc/message_bloc.dart';
import 'features/point/bloc/point_bloc.dart';
import 'features/profile/profile_bloc.dart';
import 'features/remote/bloc/remote_bloc.dart';
import 'features/settings/bloc/settings_bloc.dart';

import 'core/util/router_generator.dart';
import 'features/auth/auth_bloc.dart';
import 'injections/dependencies.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

/// This widget is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // Add all the possible Blocs here
          BlocProvider<AuthBloc>(
            create: (context) => sl<AuthBloc>(),
          ),
          BlocProvider<ProfileBloc>(create: (context) => sl<ProfileBloc>()),
          BlocProvider<MessageBloc>(create: (context) => sl<MessageBloc>()),
          BlocProvider<PointBloc>(create: (context) => sl<PointBloc>()),
          BlocProvider<BadgeBloc>(create: (context) => sl<BadgeBloc>()),
          BlocProvider<RemoteBloc>(create: (context) => sl<RemoteBloc>()),
          BlocProvider<SettingsBloc>(create: (context) => sl<SettingsBloc>()),
          BlocProvider<ProfileBloc>(create: (context) => sl<ProfileBloc>()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter POC',
          theme: ThemeData(
            primaryColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            sliderTheme: SliderThemeData(
                thumbColor: Colors.white,
                activeTrackColor: ColorUtils.parse(AppColors.sliderTrack)),
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: Colors.blue),
            useMaterial3: true,
          ),
          routerConfig: RouterGenerator.routerGenerator(),
        ));
  }
}
