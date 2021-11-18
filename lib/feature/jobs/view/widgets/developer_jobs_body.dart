// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_text_style.dart';
import 'package:flutter_clean_architecture/core/init/injection_container.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_filter_card.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_recenlty_added_card.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_recommended_for_you_card.dart';
import 'package:flutter_clean_architecture/feature/jobs/viewmodel/jobs_provider.dart';
import 'package:provider/provider.dart';

class DeveloperJobsBody extends StatelessWidget {
  const DeveloperJobsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headTitleTexts(),
            listViewHorizontalDeveloperFilter(),
            listViewHorizontalRecommendedForYou(),
            listViewVerticalRecentlyAdded(),
          ],
        ),
      ),
    );
  }

  Widget headTitleTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Developer',
          style: AppTextStyle.headTitleStyle,
        ),
        Text(
          'Jobs',
          style: AppTextStyle.headTitleStyle,
        ),
      ],
    );
  }

  Widget listViewHorizontalDeveloperFilter() {
    return Consumer<JobsProvider>(
      builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
        return Padding(
            padding: EdgeInsets.only(bottom: 25.0, top: jobsProvider.filters.isNotEmpty ? 25 : 0),
            child: SizedBox(
              height: jobsProvider.filters.isNotEmpty ? 40 : 0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal, //Sağdan sola, soldan sağa hareketini sağladık.
                itemBuilder: (BuildContext context, int index) {
                  return DeveloperFilterCard(index: index);
                },
                itemCount: jobsProvider.filters.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 20);
                },
              ),
            ));
      },
    );
  }

  Widget listViewHorizontalRecommendedForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended for you",
          style: AppTextStyle.subTitleStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0, top: 20),
          child: SizedBox(
            height: 200,
            child: Consumer<JobsProvider>(
              builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal, //Sağdan sola, soldan sağa hareketini sağladık.
                  itemBuilder: (BuildContext context, int index) {
                    return DeveloperRecommendedForYouCard(index: index);
                  },
                  itemCount: jobsProvider.jobAdvertisement.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget listViewVerticalRecentlyAdded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recently Added",
          style: AppTextStyle.subTitleStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0, top: 20, right: 20),
          child: SizedBox(
            height: serviceLocator<JobsProvider>().jobAdvertisement.length * 100,
            child: Consumer<JobsProvider>(
              builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return DeveloperRecenltyAddedCard(index: index);
                  },
                  shrinkWrap: true,
                  itemCount: jobsProvider.jobAdvertisement.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
