import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uifreelance/model/job.dart';
import 'package:uifreelance/utils/app_colors.dart';
import 'package:uifreelance/utils/app_constants.dart';
import 'package:uifreelance/utils/app_widgets.dart';

class DetailScreen extends StatefulWidget {
  final JobModel job;

  DetailScreen({Key key, @required this.job}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  JobModel _jobModel;

  @override
  void initState() {
    super.initState();
    _jobModel = widget.job;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: bgColor,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(),
                SizedBox(
                  height: 20,
                ),
                TitleAppWidget(
                  jobModel: _jobModel,
                ),
                SizedBox(
                  height: 20,
                ),
                DescriptionWidget(
                  jobModel: _jobModel,
                ),
                SizedBox(
                  height: 20,
                ),
                _jobModel.isEnd
                    ? Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AcceptedWorkerWidget(
                                            jobModel: _jobModel),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        DeadLineWidget(jobModel: _jobModel)
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(ic_sample_presentasi_blue),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    "Attachment",
                                    fontSize: fontSizeMediumBig,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.asset(
                                                img_art2,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            height: 150,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.asset(
                                                img_art1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.asset(
                                                img_art3,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ApplicationsWidget(
                        jobModel: _jobModel,
                      ),
                // FlatButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeadLineWidget extends StatelessWidget {
  const DeadLineWidget({
    Key key,
    @required JobModel jobModel,
  })  : _jobModel = jobModel,
        super(key: key);

  final JobModel _jobModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //selected
          Container(
              width: 50,
              height: 50,
              child: SvgPicture.asset(ic_circle_red_deadline)),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                "Deadline",
                fontSize: fontSizeSmall,
                fontColor: textSecondaryColor,
              ),
              TextWidget(
                _jobModel.deadLine,
                fontSize: fontSizeMediumSmall,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AcceptedWorkerWidget extends StatelessWidget {
  const AcceptedWorkerWidget({
    Key key,
    @required JobModel jobModel,
  })  : _jobModel = jobModel,
        super(key: key);

  final JobModel _jobModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //selected
          Container(
            width: 50,
            height: 50,
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    // backgroundColor: avatarMyTeamColor,
                    // child: Text('P'),
                    backgroundImage:
                        AssetImage(_jobModel.selectedAplicator.img),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    child: SvgPicture.asset(ic_verified),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                "Accepted Worker",
                fontSize: fontSizeSmall,
                fontColor: textSecondaryColor,
              ),
              TextWidget(
                _jobModel.selectedAplicator.name,
                fontSize: fontSizeMediumSmall,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ApplicationsWidget extends StatelessWidget {
  final JobModel jobModel;
  const ApplicationsWidget({
    @required this.jobModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                "Applications (${jobModel.applicants.length})",
                fontSize: fontSizeSmall,
                fontColor: textSecondaryColor,
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: jobModel.applicants.length,
                itemBuilder: (context, index) {
                  return ApplicatorWidget(
                    aplicator: jobModel.applicants[index],
                  );
                },
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Color(0xFF5848FD)),
            child: TextWidget(
              "Apply for this job",
              fontColor: textWhiteColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSizeMedium,
            ),
          ),
        ),
      ],
    ));
  }
}

class ApplicatorWidget extends StatelessWidget {
  final Aplicator aplicator;
  final bool isSelected;

  const ApplicatorWidget({
    @required this.aplicator,
    this.isSelected = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            child: CircleAvatar(
              // backgroundColor: avatarMyTeamColor,
              // child: Text('P'),
              backgroundImage: AssetImage(aplicator.img),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          TextWidget(
            aplicator.name,
            fontSize: fontSizeMediumSmall,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  final JobModel jobModel;
  const DescriptionWidget({
    @required this.jobModel,
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
            "Description",
            fontSize: fontSizeMediumSmall,
            fontColor: textSecondaryColor,
          ),
          TextWidget(
            jobModel.description,
            fontSize: fontSizeSmall,
          ),
          !jobModel.isEnd
              ? PriceAndDeadlineWidget(
                  jobModel: jobModel,
                )
              : Container(),
        ],
      ),
    );
  }
}

class PriceAndDeadlineWidget extends StatelessWidget {
  final JobModel jobModel;
  const PriceAndDeadlineWidget({
    @required this.jobModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          // Icon()
          Container(
            child: Row(
              children: [
                Container(
                  child: SvgPicture.asset(
                    ic_circle_green_dolar,
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextWidget(
                  "${jobModel.currency} ${jobModel.price}",
                  fontSize: fontSizeSmall,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              children: [
                Container(
                  child: SvgPicture.asset(
                    ic_circle_red_deadline,
                    width: 22,
                    height: 22,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextWidget(
                  "Selecting until ${jobModel.deadLine}",
                  fontSize: fontSizeSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAppWidget extends StatelessWidget {
  final JobModel jobModel;

  const TitleAppWidget({
    @required this.jobModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // TextWidget(),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            jobModel.jobName,
            fontSize: fontSizeSuperBig,
            fontWeight: FontWeight.w600,
          ),
          // SizedBox(height: 10,),
          TextWidget(
            "Posted By ${jobModel.postedBy}",
            fontSize: fontSizeSmall,
            fontColor: textSecondaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: jobModel.categories
                .map((val) => Container(
                      margin: EdgeInsets.only(right: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: jobModel.colorsecondary),
                      child: TextWidget(
                        val,
                        fontColor: textWhiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context){
              Navigator.pop(context);
              // }));
            },
            child: Container(
              child: SvgPicture.asset(
                ic_left_arrow,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              children: [
                Container(
                  child: SvgPicture.asset(
                    ic_notifications,
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: SvgPicture.asset(
                    ic_menu,
                    width: 7,
                    height: 7,
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
