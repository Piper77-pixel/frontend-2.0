import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controller/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BgImageWidget(
        // padding: EdgeInsets.fromLTRB(24, 0, 25, 40),
        bgImage: onboardingController.currentIndex.value == 0
            ? DefaultImages.p1bgImage
            : onboardingController.currentIndex.value == 2
            ? DefaultImages.p3bgImage
            : DefaultImages.bgImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                assetImage(DefaultImages.starCircleAppLogoImage, fit: BoxFit.cover),
                skipButton(context),
              ],
            ),
            SizedBox(
              height: 153,
              child: PageView.builder(
                controller: onboardingController.pageController,
                onPageChanged: (index) => onboardingController.currentIndex.value = index,
                itemCount: onboardingController.onboardingData.length,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = onboardingController.onboardingData[index];
                  return Padding(padding: const EdgeInsets.symmetric(horizontal: 22), child: assetImage(data["image"]));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  onboardingController.currentIndex.value == 0
                      ? horizontalSpace(0)
                      : Expanded(
                          child: CommonThemeButton(
                            onPressed: onboardingController.currentIndex.value > 0
                                ? () {
                                    onboardingController.pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                  }
                                : null,
                            isBlack: true,
                            title: AppString.kPrevious,
                          ),
                        ),
                  if (onboardingController.currentIndex.value != 0) horizontalSpace(16),
                  Expanded(
                    child: CommonThemeButton(
                      onPressed: () {
                        if (onboardingController.currentIndex.value == onboardingController.onboardingData.length - 1) {
                          // Last page → navigate
                          navigatePushAndRemoveUntil(context, DashboardManager());
                        } else {
                          onboardingController.pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                        }
                      },
                      title: onboardingController.currentIndex.value == onboardingController.onboardingData.length - 1 ? AppString.kStart : AppString.kNext,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Align skipButton(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topRight,
      child: GestureDetector(
        onTap: () {
          navigatePushAndRemoveUntil(context, DashboardManager());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
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
