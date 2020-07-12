import 'package:flutter/material.dart';
import 'package:recruitsite/data.dart';
import '../../screens/home/components/app_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScreenTypeLayout(
      desktop: CustomHome(
        size: size,
        isMobile: false,
      ),
      mobile: CustomHome(size: size, isMobile: true),
    );
  }
}

class CustomHome extends StatelessWidget {
  final bool isMobile;
  final Size size;

  CustomHome({this.isMobile, this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(isMobile ? mobileBgImage : desktopBgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(isMobile),
            Spacer(),
            Body(isMobile: isMobile),
            Spacer(
              flex: isMobile ? 3 : 2,
            ),
          ],
        ),
      ),
    );
  }
}
