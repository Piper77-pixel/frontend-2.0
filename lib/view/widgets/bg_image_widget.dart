import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BgImageWidget extends StatelessWidget {
  final String? bgImage;
  final EdgeInsets? padding;
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const BgImageWidget({super.key, this.padding, required this.child, this.floatingActionButton, this.floatingActionButtonLocation, this.bottomNavigationBar, this.bgImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGround,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: padding,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bgImage??DefaultImages.bgImage), fit: BoxFit.fill),
        ),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
