
import 'package:flutter/material.dart';

class JobModel {
  final String jobName;
  final String deadLine;
  final Color colorbg;
  final Color colorsecondary;
  final String percentage;

  JobModel({@required this.jobName, @required this.deadLine, @required this.colorbg, @required this.colorsecondary, @required this.percentage});
}