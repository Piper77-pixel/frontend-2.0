import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/view/screen/challenge_screen/challenge_widget.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgImageWidget(
      bgImage: DefaultImages.homeBgImage,
      child: Column(
        children: [
          challengeAppBar(AppString.kExplore.tr),
          Expanded(
            child: Obx(() {
              return ListView(shrinkWrap: true, padding: EdgeInsets.fromLTRB(16, 24, 16, 20), children: []);
            }),
          ),
        ],
      ),
    );
  }
}
