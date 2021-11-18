// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_text_style.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_your_application_page_widgets/cards/your_application_card.dart';
import 'package:flutter_clean_architecture/feature/jobs/viewmodel/jobs_provider.dart';
import 'package:provider/provider.dart';

class DeveloperYourApplicationBody extends StatelessWidget {
  const DeveloperYourApplicationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsProvider>(
      builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headTitleTexts(jobsProvider),
              listViewYourApplications(jobsProvider),
            ],
          ),
        );
      },
    );
  }

  Widget headTitleTexts(JobsProvider jobsProvider) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your',
            style: AppTextStyle.headTitleStyle,
          ),
          Text(
            'applications (${jobsProvider.jobAdvertisement.length})',
            style: AppTextStyle.headTitleStyle,
          ),
        ],
      ),
    );
  }

  Widget listViewYourApplications(JobsProvider jobsProvider) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return YourApplicationCard(index: index);
        },
        itemCount: jobsProvider.jobAdvertisement.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20);
        },
      ),
    );
  }
}
