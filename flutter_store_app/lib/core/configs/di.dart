import 'package:flutter/widgets.dart';
import 'package:flutter_store_app/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_store_app/data/repositories/auth_repository.dart';
import 'package:flutter_store_app/ui/authentication/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; // sl stands for service locator

/// Initializes the dependency injection.
Future<void> initDI() async {
  debugPrint('init DI');
  _initAuth();
  await _initSharedPreferences();
  debugPrint('init DI successfully');
  // Register your dependencies here. For example:
  //
  // sl.registerLazySingleton<ApiClient>(() => ApiClient());
  // sl.registerFactory<ProductRepository>(() => ProductRepositoryImpl(apiClient: sl()));
}

void _initAuth() {
  sl
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDataSource: sl<AuthRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(authRepository: sl<AuthRepository>()),
    );
}

Future<void> _initSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
