import 'package:flutter_clean_architecture/core/error/failures/general_failures.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys.dart';
import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferences sharedPreferences;
  SharedPreferencesRepositoryImpl({required this.sharedPreferences});
  @override
  Future<Either<Failure, String>> getDataFromKey(SharedPreferencesKeys key) async {
    String? getData = sharedPreferences.getString(key.sharedKeyStateToKeyValues());
    if (getData != null) {
      return Right(getData);
    } else {
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeDataFromKey(SharedPreferencesKeys key) async {
    bool isRemove = await sharedPreferences.remove(key.sharedKeyStateToKeyValues());
    if (isRemove) {
      return const Right(null);
    } else {
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveDataFromKey(SharedPreferencesKeys key, String data) async {
    bool saveData = await sharedPreferences.setString(key.sharedKeyStateToKeyValues(), data);
    if (saveData) {
      return const Right(null);
    } else {
      return Left(NullPointerFailure());
    }
  }
}
