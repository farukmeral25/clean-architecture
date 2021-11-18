import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failures/failure.dart';
import 'package:flutter_clean_architecture/core/platform/network_info.dart';

import 'package:flutter_clean_architecture/feature/jobs/data/datasource/job_local_data_source.dart';
import 'package:flutter_clean_architecture/feature/jobs/data/datasource/job_remote_data_source.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/repository/job_repository.dart';

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource jobRemoteDataSource;
  final JobLocalDataSource jobLocalDataSource;
  final NetworkInfo networkInfo;

  JobRepositoryImpl({required this.jobRemoteDataSource, required this.jobLocalDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Job>>> getJobData() {
    // TODO: implement getEventData
    throw UnimplementedError();
  }
}
