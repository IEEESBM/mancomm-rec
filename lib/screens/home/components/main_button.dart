import 'package:flutter/material.dart';

import '../../../constant.dart';

InkWell mainButton(String text, Function tap, bool isMobile) {
  return InkWell(
    onTap: tap,
    child: FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(isMobile ? 13 : 15),
        decoration: BoxDecoration(
          color: Color(0xFF372930),
          borderRadius: BorderRadius.circular(34),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF372930),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(width: 15),
            Text(
              text.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 14 : 19,
              ),
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
    ),
  );
}
