import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';

class CommonSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final double borderRadius;

  const CommonSearchTextField({
    super.key,
    required this.controller,
    required this.hintText ,
    this.onChanged,
    this.onClear,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.borderRadius = 12.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        style: pLatoSemiBold10.copyWith(fontSize: 14),
        decoration: InputDecoration(
          fillColor: AppColors.kTextField,
          filled: true,
          hintText: hintText,
          labelStyle: pLatoRegular10.copyWith(),
          hintStyle: pRobotoRegular10.copyWith(fontSize: 14),
          counterText: '',
          errorStyle: TextStyle(height: 0, fontSize: 0),
          counterStyle: TextStyle(height: 0, fontSize: 0),
          suffixIcon: Padding(padding: const EdgeInsets.only(right: 16), child: assetImage(DefaultImages.searchIcon)),
          suffixIconConstraints: BoxConstraints(maxWidth: 40, minWidth: 35),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          prefixText: ' ',
          // border: InputBorder.none,
          border: GradientOutlineInputBorder(
            gradient: LinearGradient(colors: AppColors.linerSelectedTextFieldBorderColor, begin: Alignment.topCenter, end: Alignment.bottomCenter),
            width: 1,
            borderRadius: BorderRadius.circular(AppDimen.buttonRadius),
          ),
          enabledBorder: GradientOutlineInputBorder(
            gradient: LinearGradient(colors: AppColors.linerSelectedTextFieldBorderColor, begin: Alignment.topCenter, end: Alignment.bottomCenter),
            width: 1,
            borderRadius: BorderRadius.circular(AppDimen.buttonRadius),
          ),
          focusedBorder: GradientOutlineInputBorder(
            gradient: LinearGradient(colors: AppColors.linerSelectedTextFieldBorderColor, begin: Alignment.topCenter, end: Alignment.bottomCenter),
            width: 1,
            borderRadius: BorderRadius.circular(AppDimen.buttonRadius),
          ),
        ),
      ),
    );
  }
}

Widget friendRequestsWidget({
  String? profile,
  String? title,
  String? time,
  String? mutualFri,
  List? friendList,
  Function()? actionDecline,
  Function()? actionAccept,
  Function()? actionProfile,
  bool isShowButton = true,
  double? profileSize,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Container(
      decoration: boxDecoration(
        color: AppColors.kBlack,
        radius:AppDimen.buttonRadius,
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [AppColors.kThemeFont, AppColors.kHex7127CF], stops: [0.0, 1.0], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          GestureDetector(
            onTap: actionProfile,
            child: Container(
              height: profileSize ?? 72,
              width: profileSize ?? 72,
              decoration: boxShapeDecoration(
                color: AppColors.kBlack,
                shape: BoxShape.circle,
                border: GradientBoxBorder(gradient: LinearGradient(colors: [AppColors.kHex60148C, AppColors.kHexC674F7] /*begin: Alignment.topRight, end: Alignment.bottomCenter*/), width: 1.36),
              ),
              padding: EdgeInsets.all(2),
              child: Center(
                child: Container(
                  // height: 64,
                  // width: 64,
                  decoration: boxShapeDecoration(
                    shape: BoxShape.circle,
                    decorationImage: DecorationImage(image: NetworkImage(profile!)),
                  ),
                ),
              ),
            ),
          ),
          horizontalSpace(20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title!, style: pNunitoBold10.copyWith(fontSize: 16), overflow: TextOverflow.ellipsis),
                verticalSpace(2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    mutualFriends(friendList![0], friendList[1]),
                    horizontalSpace(2),
                    Text('$mutualFri ${AppString.kMutualFriends.tr} | $time ${AppString.kAgo.tr}', style: pRobotoRegular10.copyWith(fontSize: 10)),
                  ],
                ),
                verticalSpace(isShowButton ? 2 : 0),
                isShowButton
                    ? Row(
                        children: [
                          CommonButton(onPressed: actionDecline, title: AppString.kDecline.tr, btnColor: AppColors.kHex740E0E, width: 83, height: 23, style: pNunitoBold10, radius: 4),
                          horizontalSpace(8),
                          CommonButton(onPressed: actionAccept, title: AppString.kAccept.tr, btnColor: AppColors.kHex632BA4, width: 83, height: 23, style: pNunitoBold10, radius: 4),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

mutualFriends(String image1, image2) {
  return SizedBox(
    width: 35,
    child: Stack(
      children: [
        smallProfileImage(image1),
        image2 == null ? SizedBox() : Positioned(left: 12, child: smallProfileImage(image2)),
      ],
    ),
  );
}

Container smallProfileImage(String image) {
  return Container(
    height: 20,
    width: 20,
    decoration: boxShapeDecoration(
      shape: BoxShape.circle,
      decorationImage: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
    ),
  );
}
