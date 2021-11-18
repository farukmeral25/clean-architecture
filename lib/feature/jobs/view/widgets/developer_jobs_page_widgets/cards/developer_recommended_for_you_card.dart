// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_text_style.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/theme.dart';
import 'package:flutter_clean_architecture/feature/jobs/viewmodel/jobs_provider.dart';
import 'package:provider/provider.dart';

class DeveloperRecommendedForYouCard extends StatelessWidget {
  const DeveloperRecommendedForYouCard({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsProvider>(builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
      return Container(
        width: 200,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            logoAndWorkingTime(jobsProvider),
            jobTitleAndJobPrice(jobsProvider),
          ],
        ),
      );
    });
  }

  Widget logoAndWorkingTime(JobsProvider jobsProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
          jobsProvider.jobAdvertisement[index].jobImagePath,
          height: 60,
          width: 60,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.skin,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: Text(
              jobsProvider.jobAdvertisement[index].workingTime,
              style: AppTextStyle.body12w500,
            ),
          ),
        )
      ],
    );
  }

  Widget jobTitleAndJobPrice(JobsProvider jobsProvider) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jobsProvider.jobAdvertisement[index].jobTitle,
            style: AppTextStyle.filterTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            jobsProvider.jobAdvertisement[index].jobPrice,
            style: AppTextStyle.subTitleStyle,
          ),
        ],
      ),
    );
  }
}
