// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_text_style.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/theme.dart';
import 'package:flutter_clean_architecture/feature/jobs/domain/entities/job_card_state.dart';
import 'package:flutter_clean_architecture/feature/jobs/viewmodel/jobs_provider.dart';
import 'package:provider/provider.dart';

class YourApplicationCard extends StatelessWidget {
  const YourApplicationCard({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsProvider>(
      builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                logoTitleMoreWidgets(jobsProvider),
                recruitmentProcessesAndJobPrice(jobsProvider),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget logoTitleMoreWidgets(JobsProvider jobsProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0, left: 10),
          child: Image.network(
            jobsProvider.jobAdvertisement[index].job.jobImagePath,
            height: 60,
            width: 60,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobsProvider.jobAdvertisement[index].job.jobTitle,
                style: AppTextStyle.subTitleStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                jobsProvider.jobAdvertisement[index].job.companyName,
                style: AppTextStyle.body12w500.copyWith(
                  color: AppColor.grey,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.more_vert,
          ),
        ),
      ],
    );
  }

  Widget recruitmentProcessesAndJobPrice(JobsProvider jobsProvider) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 140,
            decoration: BoxDecoration(
              color: AppColor.skin,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                jobsProvider.jobAdvertisement[index].cardState.stateToText(),
                style: AppTextStyle.body14w700.copyWith(
                  color: jobsProvider.jobAdvertisement[index].cardState.stateToColor(),
                ),
              ),
            ),
          ),
          Text(
            jobsProvider.jobAdvertisement[index].job.jobPrice,
            style: AppTextStyle.subTitleStyle,
          ),
        ],
      ),
    );
  }
}
