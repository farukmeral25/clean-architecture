import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_keys_params.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';

class GetDataFromKeyUsecase extends Usecase<String, SharedPreferenceKeyParams> {
  SharedPreferencesRepository repository;
  GetDataFromKeyUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.getDataFromKey(params.key);
  }
}
