import 'package:brain_bucks/core/controller/dashboard_controller.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:flutter/material.dart';
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
    return BgImageWidget(child: Text("data"));
    // return Obx(() {
    //   return Container(
    //     height: Get.height,
    //     width: Get.width,
    //     decoration: BoxDecoration(
    //       image: DecorationImage(image: AssetImage(DefaultImages.bgImage), fit: BoxFit.fill),
    //     ),
    //     child: SafeArea(
    //       child: Scaffold(
    //         backgroundColor: AppColors.kTransparent,
    //         // body: dashboardController.itemList[dashboardController.selectedIndex.value]['screen'],
    //         bottomNavigationBar: Padding(
    //           padding: const EdgeInsets.fromLTRB(20, 0, 20, 5), // padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    //         ),
    //       ),
    //     ),
    //   );
    // });
  }

  Column itemWidget(dict, Color cFont) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(dict['icn'], color: cFont, width: 17, height: 17),
        verticalSpace(4),
        Text(dict['title'], style: pNunitoSemiBold10.copyWith(color: cFont ?? AppColors.kWhite.withOpacity(0.4))),
      ],
    );
  }
}
