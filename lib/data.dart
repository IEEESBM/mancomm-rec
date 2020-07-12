import 'package:recruitsite/models/social.dart';
import 'package:recruitsite/models/timeline.dart';

String appbarTitle = "IEEE SBM";
String title = "Recruitments";
String subtitle = "Open for students of '23 of all branches.";

String mobileBgImage = "assets/images/bg_mobile1.png";
String desktopBgImage = "assets/images/bg.png";
String logo = "assets/images/logoLightBg.png";

String timelineHead = "Details";

Social sc1 = new Social(
    imgUrl: "assets/assets/images/github.png",
    link: "https://github.com/IEEE-SBM20-21");
Social sc2 = new Social(
    imgUrl: "assets/assets/images/facebook.png",
    link: "https://www.facebook.com/ieeesbmanipal");
Social sc3 = new Social(
    imgUrl: "assets/assets/images/instagram.png",
    link: "https://www.instagram.com/ieeesbm");
Social s4 =
    new Social(title: "Projects", link: "https://ieee-sbm20-21.github.io/");

TimeLine t1 = new TimeLine(
    time: '10-15',
    heading: 'Mancomm Registration',
    content:
        'Send your details and specify your domains to register for mancomm recruitments.');

TimeLine t2 = new TimeLine(
    time: '11-13',
    heading: 'Decrypt: Online cryptic hunt',
    content:
        'Top contestants of \'23 batch get direct entry to interview for mancomm!');

TimeLine t3 = new TimeLine(
    time: '18-21',
    heading: 'Mancomm Interviews',
    content:
        'Shortlisted members shall give their online interviews with the board during these dates.');

TimeLine t4 = new TimeLine(
    time: '24',
    heading: 'Mancomm Results',
    content: 'Results of our recruitment process shall be announced!');
