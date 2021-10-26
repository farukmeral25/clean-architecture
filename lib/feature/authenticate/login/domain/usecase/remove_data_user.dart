import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/feature/authenticate/login/domain/repository/login_repository.dart';

class RemoveDataUserUsecase implements Usecase<void, NoParams> {
  LoginRepository repository;
  RemoveDataUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams noParams) async {
    return await repository.removeDataUser();
  }
}
