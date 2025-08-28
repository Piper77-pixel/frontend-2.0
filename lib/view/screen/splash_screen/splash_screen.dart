import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/screen/onboarding_screen/onboarding_screen.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/custom_progressbar.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      splashScreenLoad();
    });
  }

  void splashScreenLoad() {
    if (Prefs.getONBOARDING() == true) {
      navigatePushAndRemoveUntil(context, DashboardManager());
    } else {
      // Get.offAll(() => OnBoardingScreen());
      navigatePushAndRemoveUntil(context, OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BgImageWidget(
      floatingActionButton: Padding(
        padding: AppDimen.screenPadding,
        child: ImageFillProgressBar(value: 0.65, fillImage: AssetImage(DefaultImages.themeButtonImage), height: 18),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      child: Column(children: [Center(child: assetImage(DefaultImages.circleAppLogoImage))]),
    );
  }
}
