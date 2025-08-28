import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonThemeButton extends StatelessWidget {
  final String? title;
  final String? icon;
  final double? height;
  final double? width;
  final double? horizontal;
  final double? fontSize;
  final Function()? onPressed;
  final Color? bColor;
  final Color? btnColor;
  final Color? textColor;
  final double? radius;
  final FontWeight? fontWeight;
  final bool isBlack;

  const CommonThemeButton({
    super.key,
    this.title,
    this.height,
    this.width,
    this.onPressed,
    this.bColor,
    this.btnColor,
    this.textColor,
    this.fontSize,
    this.horizontal,
    this.radius,
    this.fontWeight,
    this.isBlack = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.zero,
      pressedOpacity: 0.2,
      onPressed: onPressed,
      child: Container(
        width: width ?? Get.width,
        height: height ?? 56,
        decoration: BoxDecoration(
          // color: btnColor ?? AppColors.kThemeColor,
          // color: isBlack == true ? AppColors.kLightBlack : AppColors.kThemeColor,
          image: DecorationImage(image: AssetImage(isBlack ? DefaultImages.greyButtonImage : DefaultImages.themeButtonImage), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(radius ?? AppDimen.buttonRadius),
          border: Border.all(color: bColor ?? AppColors.kTransparent),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) SizedBox(width: 28, height: 28, child: assetImage(icon!)),
              if (icon != null) horizontalSpace(horizontal ?? 8),
              Text(
                title!,
                style: pNunitoBold10.copyWith(
                  color: textColor ?? AppColors.kFont,
                  fontSize: fontSize ?? 22, //14
                  fontWeight: fontWeight??FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final String? title;
  final String? icon;
  final double? height;
  final double? width;
  final double? horizontal;
  final double? fontSize;
  final Function()? onPressed;
  final Color? bColor;
  final Color? btnColor;
  final Color? textColor;
  final double? radius;
  final FontWeight? fontWeight;

  const CommonButton({
    super.key,
    this.title,
    this.height,
    this.width,
    this.onPressed,
    this.bColor,
    this.btnColor,
    this.textColor,
    this.fontSize,
    this.horizontal,
    this.radius,
    this.fontWeight,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.zero,
      pressedOpacity: 0.2,
      onPressed: onPressed,
      child: Container(
        width: width ?? Get.width,
        height: height ?? 45,
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.kThemeColor,
          borderRadius: BorderRadius.circular(radius ?? AppDimen.buttonRadius),
          border: Border.all(color: bColor ?? AppColors.kTransparent),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) SizedBox(width: 20, height: 20, child: Image.asset(icon!)),
              if (icon != null) horizontalSpace(8),
              Text(
                title!,
                style: pRobotoBold10.copyWith(
                  color: textColor ?? AppColors.kFont,
                  fontSize: fontSize ?? 16, //14
                  fontWeight: fontWeight,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
