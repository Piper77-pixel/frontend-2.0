import 'package:get/get.dart';

class SizeConfig {
  static double screenHeight = Get.height;
  static double screenWidth = Get.width;

  // dynamic height (based on design height e.g. 844 for iPhone 13)
  static double h(double inputHeight, {double designHeight = 844}) {
    return (inputHeight / designHeight) * screenHeight;
  }

  // dynamic width (based on design width e.g. 390 for iPhone 13)
  static double w(double inputWidth, {double designWidth = 390}) {
    return (inputWidth / designWidth) * screenWidth;
  }

  // dynamic font size
  static double sp(double inputSize, {double designWidth = 390}) {
    return (inputSize / designWidth) * screenWidth;
  }
}