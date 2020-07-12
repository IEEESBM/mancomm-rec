import 'package:flutter/material.dart';
import 'dart:js' as js;

import '../../../data.dart';

Container showSocialLinks() {
  return Container(
    child: Row(
      children: [
        socialIconButton(sc1.link, sc1.imgUrl),
        socialIconButton(sc2.link, sc2.imgUrl),
        socialIconButton(sc3.link, sc3.imgUrl),
      ],
    ),
  );
}

InkWell socialIconButton(String url, String path) {
  return InkWell(
    onTap: () {
      js.context.callMethod("open", [url]);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 22,
          // width: 22,
          child: Image.network(
            path,
          )),
    ),
  );
}
