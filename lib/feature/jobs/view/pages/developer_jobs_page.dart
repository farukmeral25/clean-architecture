import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_color.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_jobs_app_bar.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_jobs_body.dart';

class DeveloperJobsPage extends StatelessWidget {
  const DeveloperJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.skin,
      appBar: DeveloperJobsAppbar(),
      body: DeveloperJobsBody(),
    );
  }
}
