import 'package:dartz/dartz.dart';

import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/repository/job_repository.dart';

class GetEventDataUsecase implements Usecase<List<Job>, NoParams> {
  JobRepository repository;
  GetEventDataUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<Job>>> call(NoParams params) async {
    return await repository.getJobData();
  }
}
