import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/data/repo/shared_preferences_repository_impl.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/get_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/remove_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/save_data_from_key_usecase.dart';
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
}
