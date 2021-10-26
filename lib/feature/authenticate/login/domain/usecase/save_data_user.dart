import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/argument/user_argument.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/repository/login_repository.dart';

class SaveDataUserUsecase implements Usecase<void, UserArgument> {
  LoginRepository repository;
  SaveDataUserUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(UserArgument params) async {
    return await repository.saveDataUser(params);
  }
}
