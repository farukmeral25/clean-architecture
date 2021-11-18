import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/data/repo/shared_preferences_repository_impl.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/get_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/remove_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/save_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/data/repo_impl/login_repository_impl.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/repository/login_repository.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/usecase/get_data_user.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/usecase/remove_data_user.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/usecase/save_data_user.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/viewmodel/login_provider.dart';
import 'package:flutter_clean_architecture/feature/jobs/viewmodel/jobs_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  //? Shared Preferences
  //* Repo
  serviceLocator.registerLazySingleton<SharedPreferencesRepository>(
      () => SharedPreferencesRepositoryImpl(sharedPreferences: serviceLocator()));
  //* Use Case
  serviceLocator.registerLazySingleton(() => GetDataFromKeyUsecase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => RemoveDataFromKeyUsecase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => SaveDataFromKeyUsecase(repository: serviceLocator()));

  //? Login
  //* Provider
  serviceLocator.registerLazySingleton(() =>
      LoginProvider(getDataUser: serviceLocator(), removeDataUser: serviceLocator(), saveDataUser: serviceLocator()));

  //* Repo

  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      getDataFromKeyUsecase: serviceLocator(),
      saveDataFromKeyUsecase: serviceLocator(),
      removeDataFromKeyUsecase: serviceLocator(),
    ),
  );

  //* Usecase

  serviceLocator.registerLazySingleton(() => GetDataUserUsecase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => RemoveDataUserUsecase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => SaveDataUserUsecase(repository: serviceLocator()));

  //? Jobs
  serviceLocator.registerLazySingleton(() => JobsProvider());
}
