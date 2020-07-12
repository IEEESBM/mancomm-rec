import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFC200);
const kTextcolor = Color(0xFF241424);
const kDarkButton = Color(0xFF372930);

class CustomTextStyle {
  static TextStyle mobileHeadStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4
        .copyWith(color: kTextcolor, fontWeight: FontWeight.bold);
  }

  static TextStyle desktopHeadStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline2
        .copyWith(color: kTextcolor, fontWeight: FontWeight.bold);
  }

  static TextStyle timelineHeadStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline4.copyWith(
          color: Colors.white.withOpacity(0.8),
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle subtitleStyle = TextStyle(
    fontSize: 19,
    color: kTextcolor.withOpacity(0.34),
  );
}
