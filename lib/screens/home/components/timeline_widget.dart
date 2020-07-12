import 'package:flutter/material.dart';
import 'package:recruitsite/data.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constant.dart';

Container detailsTimeline(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: const EdgeInsets.only(
      right: 40.0,
    ),
    width: size.width * 0.4,
    height: size.height * 0.8,
    child: Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              timelineHead,
              style: CustomTextStyle.timelineHeadStyle(context),
            )),
        timeTile(t1.time, t1.heading, t1.content, isFirst: true),
        timeTile(t2.time, t2.heading, t2.content, isLeft: true),
        timeTile(t3.time, t3.heading, t3.content),
        timeTile(t4.time, t4.heading, t4.content, isLast: true, isLeft: true),
      ],
    ),
  );
}

TimelineTile timeTile(time, heading, content,
    {bool isFirst, bool isLast, bool isLeft = false}) {
  return TimelineTile(
    isFirst: isFirst ?? false,
    isLast: isLast ?? false,
    lineX: 0.3,
    alignment: TimelineAlign.center,
    indicatorStyle: IndicatorStyle(
      width: 60,
      height: 40,
      indicator: _TimelineEvent(time: time),
      drawGap: true,
    ),
    leftChild: isLeft ? timelineContent(heading, content, true) : null,
    rightChild: (!isLeft) ? timelineContent(heading, content, false) : null,
  );
}

Container timelineContent(String title, String desc, bool isLeft) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    margin: isLeft
        ? const EdgeInsets.only(right: 10)
        : const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: kPrimaryColor, fontSize: 15.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
        ),
        Container(
            child: Text(
          desc,
          style:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15.0),
        )),
      ],
    ),
  );
}

class _TimelineEvent extends StatelessWidget {
  const _TimelineEvent({Key key, this.time}) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(time, style: TextStyle(color: kPrimaryColor)),
      ),
    );
  }
}
