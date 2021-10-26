import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/entity/shared_preferences_key_with_value_params.dart';
import 'package:flutter_clean_architecture/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';

class SaveDataFromKeyUsecase extends Usecase<void, SharedPreferencesKeyWithValueParams> {
  SharedPreferencesRepository repository;
  SaveDataFromKeyUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.saveDataFromKey(params.key, params.data);
  }
}
