import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/entities/user_info.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/repository/login_repository.dart';

class GetDataUserUsecase implements Usecase<UserInfo, NoParams> {
  LoginRepository repository;
  GetDataUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserInfo>> call(NoParams noParams) async {
    return await repository.getDataUser();
  }
}
