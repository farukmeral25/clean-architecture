import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job.dart';

class JobModel extends Job {
  JobModel({
    required int jobId,
    required String jobTitle,
    required String jobImagePath,
    required String jobDescription,
    required String workingTime,
    required String companyName,
  }) : super(
          jobId: jobId,
          jobTitle: jobTitle,
          jobImagePath: jobImagePath,
          jobPrice: jobDescription,
          companyName: companyName,
          workingTime: workingTime,
        );
}
