import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrainBuckApp extends StatelessWidget {
  const BrainBuckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kBackGround,
        iconTheme: IconThemeData(color: AppColors.kThemeFont),

      ),
      // home: SplashScreen(),
      home: DashboardManager(index: 0,),
    );
  }
}
