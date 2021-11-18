import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job.dart';

abstract class JobRepository {
  Future<Either<Failure, List<Job>>> getJobData();
}
