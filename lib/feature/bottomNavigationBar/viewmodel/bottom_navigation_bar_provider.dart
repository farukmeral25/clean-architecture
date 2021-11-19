// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_jobs_page_widgets/developer_jobs_app_bar.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_jobs_page_widgets/developer_jobs_body.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_your_application_page_widgets/developer_your_application_app_bar.dart';
import 'package:flutter_clean_architecture/feature/jobs/view/widgets/developer_your_application_page_widgets/developer_your_application_body.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  List appbars = [DeveloperJobsAppbar(), DeveloperYourApplicationAppBar()];
  List bodies = [DeveloperJobsBody(), DeveloperYourApplicationBody()];

  int _currentIndex = 0;
  bool _visible = true;

  int get currentIndex => _currentIndex;
  set currentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool get visible => _visible;
  set visible(visible) {
    _visible = visible;
    notifyListeners();
  }
}
