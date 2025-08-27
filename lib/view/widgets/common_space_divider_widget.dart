import 'package:brain_bucks/utils/colors.dart';
import 'package:flutter/material.dart';


Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget horizontalDivider({Color? color}) {
  return Divider(
    color: color??AppColors.cDivider,
    thickness: 0.8,
  );
}
