// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job_card_info.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job_card_state.dart';

class JobsProvider with ChangeNotifier {
  List<String> filters = ["Developer", "San Francisco", "${30} - 50h", "Part-Time"];

  List<JobCardInfo> jobAdvertisement = [
    JobCardInfo(
      cardState: JobCardState.OPENED,
      job: Job(
        jobId: 1,
        jobImagePath: "https://brandlogos.net/wp-content/uploads/2015/01/Nike-symbol-vector-400x400.png",
        jobTitle: "Flutter UI-UX",
        jobPrice: "40₺/h",
        companyName: 'Nike',
        workingTime: "Full-Time",
      ),
    ),
    JobCardInfo(
      cardState: JobCardState.DELIVERED,
      job: Job(
        jobId: 2,
        jobImagePath:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/768px-Google_%22G%22_Logo.svg.png",
        jobTitle: "Product Designer",
        jobPrice: "60₺/h",
        companyName: 'Google',
        workingTime: "Part-Time",
      ),
    ),
    JobCardInfo(
      cardState: JobCardState.CANCELLED,
      job: Job(
        jobId: 3,
        jobImagePath:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/505px-Apple_logo_black.svg.png",
        jobTitle: "Lead - Middle Backend Developer",
        jobPrice: "80₺/h",
        companyName: 'Apple',
        workingTime: "Remote",
      ),
    ),
    JobCardInfo(
      cardState: JobCardState.OPENED,
      job: Job(
        jobId: 1,
        jobImagePath: "https://brandlogos.net/wp-content/uploads/2015/01/Nike-symbol-vector-400x400.png",
        jobTitle: "Flutter UI-UX",
        jobPrice: "40₺/h",
        companyName: 'Nike',
        workingTime: "Full-Time",
      ),
    ),
    JobCardInfo(
      cardState: JobCardState.DELIVERED,
      job: Job(
        jobId: 2,
        jobImagePath:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/768px-Google_%22G%22_Logo.svg.png",
        jobTitle: "Product Designer",
        jobPrice: "60₺/h",
        companyName: 'Google',
        workingTime: "Part-Time",
      ),
    ),
    JobCardInfo(
      cardState: JobCardState.CANCELLED,
      job: Job(
        jobId: 3,
        jobImagePath:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/505px-Apple_logo_black.svg.png",
        jobTitle: "Lead - Middle Backend Developer",
        jobPrice: "80₺/h",
        companyName: 'Apple',
        workingTime: "Remote",
      ),
    ),
  ];

  void deleteFilter(int index) {
    filters.removeAt(index);
    notifyListeners();
  }
}
