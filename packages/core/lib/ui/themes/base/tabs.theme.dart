import 'package:flutter/material.dart';

import 'package:fastyle_core/fastyle_core.dart';

final kFastTabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.label,
  labelStyle: kFastTextTheme.bodyText1,
  unselectedLabelStyle: kFastTextTheme.bodyText1!.copyWith(
    fontWeight: FontWeight.w300,
  ),
);
