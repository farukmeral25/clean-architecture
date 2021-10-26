import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys.dart';

abstract class SharedPreferencesRepository {
  Future<Either<Failure, String>> getDataFromKey(SharedPreferencesKeys key);
  Future<Either<Failure, void>> removeDataFromKey(SharedPreferencesKeys key);
  Future<Either<Failure, void>> saveDataFromKey(SharedPreferencesKeys key, String data);
}
