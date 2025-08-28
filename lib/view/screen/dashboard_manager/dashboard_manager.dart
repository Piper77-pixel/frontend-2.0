import 'package:brain_bucks/core/controller/dashboard_controller.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/show_auth_dialog.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:stage_navigation_bar/stage_navigation_bar.dart';

class DashboardManager extends StatefulWidget {
  final int? index;

  DashboardManager({super.key, this.index});

  @override
  State<DashboardManager> createState() => _DashboardManagerState();
}

class _DashboardManagerState extends State<DashboardManager> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.selectedIndex.value = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: AppColors.kTransparent,
          // Transparent status bar
          systemNavigationBarColor: AppColors.kBlack,
          // Black navigation bar
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(DefaultImages.bgImage), fit: BoxFit.fill),
          ),
          child: Scaffold(
            backgroundColor: AppColors.kTransparent,
            body: dashboardController.itemList[dashboardController.selectedIndex.value]['screen'],
            bottomNavigationBar: Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                color: AppColors.kBottomNavibar,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                border: Border(top: BorderSide(color: AppColors.kWhite.withOpacity(0.1))),
              ),
              child: SafeArea(
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(dashboardController.itemList.length, (index) {
                      var dict = dashboardController.itemList[index];
                      return itemWidget(dict, dashboardController.selectedIndex.value == index, () {
                        if (index == 0) {
                          dashboardController.selectedIndex.value = index;
                        } else {
                          if (Prefs.getAccessToken() == '' || Prefs.getAccessToken().isEmpty) {
                            showLoginSignupDialog(context);
                          } else {
                        dashboardController.selectedIndex.value = index;
                        }
                        }
                      });
                    }),
                  );
                }),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget itemWidget(dict, bool isSelected, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          image: isSelected ? DecorationImage(image: AssetImage(DefaultImages.selectedTabIcon), fit: BoxFit.fill) : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            assetImage(dict['icn'], h: 27, w: 27),
            verticalSpace(6),
            Text(dict['title'], style: isSelected ? pRobotoMedium10.copyWith(fontSize: 14) : pRobotoRegular10.copyWith(fontSize: 14, color: AppColors.kGreyFont)),
          ],
        ),
      ),
    );
  }
}
