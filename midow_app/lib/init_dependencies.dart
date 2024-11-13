import 'package:get_it/get_it.dart';
import 'package:midow_app/core/secrets/supabase_secrets.dart';
import 'package:midow_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:midow_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:midow_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:midow_app/features/auth/domain/usercases/user_signup.dart';
import 'package:midow_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: SupabaseSecrets.supabaseURL,
    anonKey: SupabaseSecrets.anonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
  
  // Call the auth initialization
  _initAuth();
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceIml(serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
    ),
  );
}