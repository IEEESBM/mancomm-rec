import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'reg_desktop.dart';
import 'reg_mobile.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RegMobile(),
      desktop: RegDesktop(),
    );
  }
}
