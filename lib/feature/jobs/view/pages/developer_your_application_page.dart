// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constant/theme/appTheme/theme.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_your_application_page_widgets/developer_your_application_app_bar.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_your_application_page_widgets/developer_your_application_body.dart';

class DeveloperYourApplicationPage extends StatelessWidget {
  const DeveloperYourApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.skin,
      appBar: DeveloperYourApplicationAppBar(),
      body: DeveloperYourApplicationBody(),
    );
  }
}
