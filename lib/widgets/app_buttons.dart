import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
String? text;
IconData? icon;
final Color color ;
final Color backgroundColor ;
double size;
final Color borderColor ;
bool? isIcon;

  AppButtons({ Key? key,
  this.isIcon = false,
  this.text,
  this.icon,
  required this.color,
  required this.backgroundColor,
  required this.borderColor,
  required this.size }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
    width: size,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
    color: backgroundColor,
     border: Border.all(color: borderColor,
     width: 1.0)),
     child: isIcon == false ? Center(child: AppText(text: text!,color: color)) : Center(child: Icon(icon , color: color,)), );
  }
}