
import 'package:flutter/material.dart';
import 'package:uifreelance/utils/app_colors.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final bool softWrap;
  final TextOverflow textOverflow;

  const TextWidget(this.text,{
    this.fontFamily = "Poppins",
    this.fontSize = 16,
    this.fontColor = textDefaultColor,
    this.fontWeight = FontWeight.w400,
    this.softWrap = true,
    this.textOverflow,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow ?? null,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight
      ),
      textAlign: TextAlign.left,
      softWrap: true,
    );
  }
}
