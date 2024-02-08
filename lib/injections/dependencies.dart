import 'package:flutter_poc/core/repositories/badge_repository.dart';
import 'package:get_it/get_it.dart';

import '../core/domain/usecases/profile_usecase.dart';
import '../core/repositories/point_repository.dart';
import '../core/repositories/profile_repository.dart';
import '../features/auth/auth_bloc.dart';
import '../features/badge/bloc/badge_bloc.dart';
import '../features/badge/data/badge_repository_impl.dart';
import '../features/message/bloc/message_bloc.dart';
import '../features/point/bloc/point_bloc.dart';
import '../features/point/data/point_repository_impl.dart';
import '../features/profile/data/profile_repository_impl.dart';
import '../features/profile/profile_bloc.dart';
import '../features/remote/bloc/remote_bloc.dart';
import '../features/settings/bloc/settings_bloc.dart';
import '../core/domain/usecases/point_usecase.dart';
import '../core/domain/usecases/auth_usecase.dart';
import '../core/domain/usecases/badge_usecase.dart';
import '../core/repositories/auth_repository.dart';
import '../features/auth/data/auth_repository_impl.dart';

final sl = GetIt.asNewInstance();

/// It's a place to configure all the instances that are maintain by DI
/// to avoid boiler plate codes
void setupDependencies() {
  // Register all the possible Blocs
  sl.registerFactory(() => AuthBloc(sl()));
  sl.registerFactory(() => ProfileBloc(sl()));
  sl.registerFactory(() => MessageBloc());
  sl.registerFactory(() => PointBloc(sl()));
  sl.registerFactory(() => BadgeBloc(sl()));
  sl.registerFactory(() => SettingsBloc());
  sl.registerFactory(() => RemoteBloc());

  // Register all the possible UseCases
  sl.registerLazySingleton(() => AuthUseCase(sl()));
  sl.registerLazySingleton(() => ProfileUseCase(sl()));
  sl.registerLazySingleton(() => PointUseCase(sl()));
  sl.registerLazySingleton(() => BadgeUseCase(sl()));

  // Register all the possible Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  sl.registerLazySingleton<PointRepository>(() => PointRepositoryImpl());
  sl.registerLazySingleton<BadgeRepository>(() => BadgeRepositoryImpl());
}
