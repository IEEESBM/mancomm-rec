import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:recruitsite/screens/register/reg_view.dart';
import 'package:recruitsite/data.dart';
import 'dart:js' as js;
import '../../constant.dart';
import 'components/main_button.dart';
import 'components/social_link.dart';
import 'components/timeline_widget.dart';

class Body extends StatelessWidget {
  final bool isMobile;

  Body({this.isMobile});

  @override
  Widget build(BuildContext context) {
    final TextStyle hStyle = isMobile
        ? CustomTextStyle.desktopHeadStyle(context)
        : CustomTextStyle.desktopHeadStyle(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
          isMobile ? mobileBody(hStyle, context) : desktopBody(hStyle, context),
    );
  }

  Row desktopBody(TextStyle hStyle, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 100),
                totalRepeatCount: 2,
                text: [
                  'Interested to learn coding?',
                  'Want to make an arduino/raspi project?',
                  'Dream of working on a team project?',
                  'Come join us! Coz we\'re holding our',
                  title.toUpperCase()
                ],
                textStyle: TextStyle(fontSize: 30.0, fontFamily: "Agne"),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart
                ),
            Container(
              width: isMobile ? 180 : 500,
              child: Text(subtitle, style: CustomTextStyle.subtitleStyle),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 2.5),
            // ),
            // Container(
            //   width: isMobile ? 180 : 500,
            //   child: Text('Hint: We\'re more than just a EEE club ;)', style: CustomTextStyle.subtitleStyle.copyWith(fontSize: 13.0)),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
            showSocialLinks(),
            mainButton("Register", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeView()));
            }, isMobile),
            mainButton("Decrypt", () {
              js.context
                  .callMethod("open", ["https://d3crypt.ieeemanipal.com/"]);
            }, isMobile)
          ],
        ),
        detailsTimeline(context),
      ],
    );
  }

  Column mobileBody(TextStyle hStyle, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title.toUpperCase(),
            style: CustomTextStyle.mobileHeadStyle(context)),
        Container(
          width: 180,
          child: Text(subtitle, style: CustomTextStyle.subtitleStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
        ),
        showSocialLinks(),
        mainButton("Register", () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeView()));
        }, true),
        mainButton("Decrypt", () {
          js.context.callMethod("open", ["https://d3crypt.ieeemanipal.com/"]);
        }, true)
      ],
    );
  }
}
