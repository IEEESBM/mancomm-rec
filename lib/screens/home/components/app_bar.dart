import 'package:flutter/material.dart';
import 'package:recruitsite/screens/register/reg_view.dart';
import 'package:recruitsite/data.dart';
import 'dart:js' as js;
import '../../../constant.dart';
import 'default_button.dart';

class CustomAppBar extends StatelessWidget {
  final bool isMobile;

  CustomAppBar(this.isMobile);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            logo,
            height: 25,
            alignment: Alignment.topCenter,
          ),
          SizedBox(width: 5),
          Text(
            appbarTitle.toUpperCase(),
            style: TextStyle(
                fontSize: isMobile ? 18 : 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(
            title: s4.title,
            press: () {
              js.context.callMethod("open", [s4.link]);
            },
          ),
          isMobile
              ? Container()
              : DefaultButton(
                  text: "Register",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  },
                ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Function press;
  const MenuItem({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            color: kTextcolor.withOpacity(0.3),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
