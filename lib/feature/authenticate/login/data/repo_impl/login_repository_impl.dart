import 'package:flutter_clean_architecture/core/error/failures/general_failures.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_key_with_value_params.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys_params.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/get_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/remove_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/usecase/save_data_from_key_usecase.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/data/model/user_info_model.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/user_info.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/argument/user_argument.dart';
import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final SaveDataFromKeyUsecase saveDataFromKeyUsecase;
  final GetDataFromKeyUsecase getDataFromKeyUsecase;
  final RemoveDataFromKeyUsecase removeDataFromKeyUsecase;

  LoginRepositoryImpl(
      {required this.saveDataFromKeyUsecase,
      required this.getDataFromKeyUsecase,
      required this.removeDataFromKeyUsecase});
  @override
  Future<Either<Failure, UserInfo>> getDataUser() async {
    final getDataUserEither = await getDataFromKeyUsecase(SharedPreferenceKeyParams(key: SharedPreferencesKeys.LOGIN));
    return getDataUserEither.fold((failure) {
      return Left(failure);
    }, (userData) {
      UserInfoModel userInfoModel = UserInfoModel.fromJson(userData);
      return Right(userInfoModel);
    });
  }

  @override
  Future<Either<Failure, void>> removeDataUser() async {
    final removeDataUserEither =
        await removeDataFromKeyUsecase(SharedPreferenceKeyParams(key: SharedPreferencesKeys.LOGIN));
    return removeDataUserEither.fold((failure) => Left(failure), (userData) {
      return const Right(null);
    });
  }

  @override
  Future<Either<Failure, void>> saveDataUser(UserArgument argument) {
    UserInfoModel userInfoModel = UserInfoModel(email: argument.userInfo.email, password: argument.userInfo.password);
    final saveDataUserEither = saveDataFromKeyUsecase(
      SharedPreferencesKeyWithValueParams(
        key: SharedPreferencesKeys.LOGIN,
        data: userInfoModel.toJson(),
      ),
    );
    return saveDataUserEither;
  }
}
