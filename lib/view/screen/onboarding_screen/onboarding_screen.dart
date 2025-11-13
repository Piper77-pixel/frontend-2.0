import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/icons.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/screen/onboarding_screen/onboarding1.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/controller/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // Transparent status bar
        systemNavigationBarColor: Colors.black,
        // Black navigation bar
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Obx(() {
        return BgImageWidget(
          // padding: EdgeInsets.fromLTRB(24, 0, 25, 40),
          bgImage: onboardingController.currentIndex.value == 0
              ? DefaultImages.p1bgImage
              : onboardingController.currentIndex.value == 2
              ? DefaultImages.p1bgImage
              : DefaultImages.p2bgImage,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: onboardingController.pageController,
                    onPageChanged: (index) => onboardingController.currentIndex.value = index,
                    itemCount: onboardingController.onboardingData.length,
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = onboardingController.onboardingData[index];
                      return index == 0
                          ? Onboarding1(data: data)
                          : index == 1
                          ? Onboarding2(data: data)
                          : Onboarding3(data: data);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, SizeConfig.h(58), 32, SizeConfig.h(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      skipButton(context),
                      GestureDetector(
                        onTap: () {
                          if (onboardingController.currentIndex.value == onboardingController.onboardingData.length - 1) {
                            // Last page → navigate
                            Prefs.setONBOARDING(true);
                            navigatePushAndRemoveUntil(context, DashboardManager());
                          } else {
                            onboardingController.pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                          }
                        },
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: boxDecoration(radius: 0,decorationImage: DecorationImage(image: AssetImage(DefaultImages.onboardingBtnImage))),
                          child: Center(child: Icon(onboardingController.currentIndex.value == onboardingController.onboardingData.length - 1 ? icnDone : icnNext, color: AppColors.kWhite)),
                        ),
                      ),
                      DotIndicator(itemCount: onboardingController.onboardingData.length, currentIndex: onboardingController.currentIndex.value),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Align skipButton(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topRight,
      child: GestureDetector(
        onTap: () {
          Prefs.setONBOARDING(true);
          navigatePushAndRemoveUntil(context, DashboardManager());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            AppString.kSkip.tr,
            style: pRobotoRegular10.copyWith(
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.kFont, // or any color you want
              decorationThickness: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const DotIndicator({super.key, required this.itemCount, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Container(
          width: index == currentIndex ? 32 : 6,
          height: 6,
          margin: EdgeInsets.symmetric(horizontal: 4), // Adjust spacing
          decoration: boxDecoration(radius:4, color: index == currentIndex ? AppColors.kHex7C10F9 : AppColors.kWhite),
        );
      }),
    );
  }
}
