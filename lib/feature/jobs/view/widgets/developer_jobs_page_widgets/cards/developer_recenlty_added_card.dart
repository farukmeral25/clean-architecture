import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_text_style.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/theme.dart';
import 'package:flutter_clean_architecture/feature/jobs/viewmodel/jobs_provider.dart';
import 'package:provider/provider.dart';

class DeveloperRecenltyAddedCard extends StatelessWidget {
  const DeveloperRecenltyAddedCard({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsProvider>(builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ListTile(
              leading: Image.network(
                jobsProvider.jobAdvertisement[index].jobImagePath,
                height: 40,
                width: 40,
              ),
              title: Text(jobsProvider.jobAdvertisement[index].jobTitle),
              subtitle: Text(jobsProvider.jobAdvertisement[index].companyName),
              trailing: Text(
                jobsProvider.jobAdvertisement[index].jobPrice,
                style: AppTextStyle.subTitleStyle.copyWith(
                  color: AppColor.grey,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
