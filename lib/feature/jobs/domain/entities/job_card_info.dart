import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job_card_state.dart';

class JobCardInfo {
  JobCardState cardState;
  Job job;

  JobCardInfo({
    required this.cardState,
    required this.job,
  });
}
