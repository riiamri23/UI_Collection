import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:uifreelance/model/job.dart';
import 'package:uifreelance/utils/app_colors.dart';
import 'package:uifreelance/utils/app_constants.dart';
import 'package:uifreelance/utils/app_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<JobModel> listJob = [];

  @override
  void initState() {
    super.initState();
    JobModel jobModel1 = JobModel(
        jobName: "Redesign Pixel Website",
        deadLine: "20 January",
        percentage: "assets/icons/sample_presentase.svg",
        colorbg: Color(0xFF30A7C1),
        colorsecondary: Color(0xFF56B5CA));
    JobModel jobModel2 = JobModel(
        jobName: "Mobile App Furniture",
        deadLine: "15 January",
        percentage: "assets/icons/sample_presentase.svg",
        colorbg: Color(0xFF5848FD),
        colorsecondary: Color(0xFF6B5CFF));
    JobModel jobModel3 = JobModel(
        jobName: "Redesign IKEA",
        deadLine: "25 January",
        percentage: "assets/icons/sample_presentase.svg",
        colorbg: Color(0xFF306489),
        colorsecondary: Color(0xFF4B7DA0));

    listJob.add(jobModel1);
    listJob.add(jobModel2);
    listJob.add(jobModel3);
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> jobWidgets = [];

    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: bgColor,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopBarApp(width: width),
                SizedBox(
                  height: 25,
                ),
                SearchWidget(),
                SizedBox(
                  height: 25,
                ),
                JobCardListWidget(listJob: listJob),
                SizedBox(
                  height: 25,
                ),
                NotificationWidget(),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "My Team",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TeamWidget(),
                      TeamWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundColor: avatarMyTeamColor,
              child: Text('P'),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  "Pixel Studio",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(
                  "you have 5 members",
                  fontSize: 13,
                  fontColor: textSecondaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  // decoration: new BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   border: new Border.all(
                  //     color: Colors.red,
                  //     width: 4.0,
                  //   ),
                  // ),
                  child: CircleAvatar(
                    // backgroundColor: avatarMyTeamColor,
                    // child: Text('P'),
                    backgroundImage: AssetImage(img_profile1),
                  ),
                ),
                Positioned(
                  left: 35,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    // decoration: BoxDecoration(border: Border.all(width: 1)),,
                    child: CircleAvatar(
                      // backgroundColor: avatarMyTeamColor,
                      // child: Text('P'),
                      backgroundImage:
                          AssetImage(img_profile1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            "Notification",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: notificationColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.mail,
                // ),
                Container(
                    width: 20, height: 20, child: SvgPicture.asset(ic_mail)),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "Ryan Malone",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      TextWidget(
                        "Ryan invite you to project",
                        fontSize: 15,
                        fontColor: textSecondaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 15,
                    height: 15,
                    child: SvgPicture.asset(ic_right_arrow)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JobCardListWidget extends StatelessWidget {
  const JobCardListWidget({
    Key key,
    @required this.listJob,
  }) : super(key: key);

  final List<JobModel> listJob;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: listJob
              .map((val) => Container(
                  margin: EdgeInsets.only(right: 18),
                  child: CardJobWidget(
                    jobModel: val,
                  )))
              .toList(),
        ),
      ),
    );
  }
}

class CardJobWidget extends StatelessWidget {
  final JobModel jobModel;

  const CardJobWidget({
    Key key,
    this.jobModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(
            //   Radius.circular(15),
            // ),
            color: jobModel.colorbg),
        width: 140,
        height: 170,
        child: Stack(
          children: [
            Positioned(
              bottom: 105.0,
              left: 90.0,
              child: Transform.rotate(
                angle: math.pi / 14,
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: jobModel.colorsecondary),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    child: SvgPicture.asset(jobModel.percentage),
                  ),
                  Flexible(
                      child: TextWidget(
                    jobModel.jobName,
                    fontColor: textWhiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: jobModel.colorsecondary),
                    child: TextWidget(
                      "until ${jobModel.deadLine}",
                      fontColor: textWhiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  )
                  // SizedBox(
                  //   width: 200.0,
                  //   height: 20.0,
                  //   child: new OutlineButton(
                  //       borderSide: BorderSide(width: 4.0),
                  //       child: Text('I am a button'),
                  //       onPressed: (() {})),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: 'Find Jobs',
          prefixIcon: Icon(
            Icons.search,
            color: searchColor,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: searchFillColor,
          border: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide.none,
            //borderSide: const BorderSide(),
          ),
        ),
      ),
    );
  }
}

class TopBarApp extends StatelessWidget {
  const TopBarApp({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8.0),
          //   child: Image.asset(
          //     'assets/images/lifestyle-business-people-using-laptop-computer-pink 1.jpg',
          //   ),
          // ),
          CircleAvatar(
              radius: width * 0.05, backgroundImage: AssetImage(img_profile1)),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  'Mon, Nov 9 2020',
                  fontSize: sizeFontDate,
                  fontWeight: FontWeight.w300,
                ),
                TextWidget(
                  'Hi, Mary Carter',
                  fontSize: 18,
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              ic_menu,
              width: 7,
              height: 7,
            ),
          ),
        ],
      ),
    );
  }
}
