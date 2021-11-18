import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job.dart';

abstract class JobLocalDataSource {
  Future<Job> getLastJob();
}
