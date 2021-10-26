import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_key_with_value_params.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys_params.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/argument/user_argument.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/user_info.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserInfo>> getDataUser();
  Future<Either<Failure, void>> removeDataUser();
  Future<Either<Failure, void>> saveDataUser(UserArgument argument);
}
