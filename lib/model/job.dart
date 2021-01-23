
import 'package:flutter/material.dart';

class JobModel {
  final String jobName;
  final String description;
  final String deadLine;
  final Color colorbg;
  final Color colorsecondary;
  final String percentage;
  final String postedBy;
  final List<String> categories;
  final int price;
  final String currency;
  final List<Aplicator> applicants;
  final Aplicator selectedAplicator;
  final bool isEnd;

  JobModel({@required this.jobName, @required this.deadLine, @required this.colorbg, @required this.colorsecondary, @required this.percentage, @required this.description, @required this.postedBy, @required this.categories, @required this.price, @required this.currency, @required this.isEnd, this.applicants, this.selectedAplicator, });
}

class Aplicator{
  final String name;
  final String img;
  final double percentage;
  final List<String> attachment;
  final String deadLine;

  Aplicator({@required this.deadLine, @required this.name, @required this.img, @required this.percentage, @required this.attachment});
}