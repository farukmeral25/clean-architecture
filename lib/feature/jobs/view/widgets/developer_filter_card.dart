// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/app_text_style.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/theme.dart';
import 'package:flutter_clean_architecture/feature/jobs/viewmodel/jobs_provider.dart';
import 'package:provider/provider.dart';

class DeveloperFilterCard extends StatelessWidget {
  const DeveloperFilterCard({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsProvider>(
      builder: (BuildContext context, JobsProvider jobsProvider, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  jobsProvider.filters[index],
                  style: AppTextStyle.filterTextStyle,
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    jobsProvider.deleteFilter(index);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColor.black,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
