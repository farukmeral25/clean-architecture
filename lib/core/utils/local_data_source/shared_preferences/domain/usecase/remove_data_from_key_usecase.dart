import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys_params.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';

class RemoveDataFromKeyUsecase extends Usecase<void, SharedPreferenceKeyParams> {
  SharedPreferencesRepository repository;
  RemoveDataFromKeyUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.removeDataFromKey(params.key);
  }
}
