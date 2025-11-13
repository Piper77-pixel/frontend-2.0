import 'package:brain_bucks/utils/colors.dart';
import 'package:flutter/material.dart';

BoxDecoration boxDecoration({
  Color? color,
  BorderRadiusGeometry? borderRadius,
  double? radius,
  BoxBorder? border,
  Color? bColor,
  DecorationImage? decorationImage,
  Gradient? gradient,
  List<BoxShadow>? boxShadow,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
    border: border ?? Border.all(color: bColor ?? AppColors.kTransparent),
    image: decorationImage,
    gradient: gradient,
    boxShadow: boxShadow,
  );
}

BoxDecoration boxShapeDecoration({
  Color? color,
  // BorderRadiusGeometry? borderRadius,
  // double? radius,
  BoxBorder? border,
  Color? bColor,
  DecorationImage? decorationImage,
  Gradient? gradient,
  BoxShape? shape,
}) {
  return BoxDecoration(
    color: color,
    // borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
    // borderRadius: BorderRadius.circular(radius ?? 12),
    border: border ?? Border.all(color: bColor ?? AppColors.kTransparent),
    image: decorationImage,
    gradient: gradient,
    shape: shape ?? BoxShape.rectangle,
  );
}
