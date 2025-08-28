import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'images.dart';

showMessage(String message) {
  log(message);
  // if(kDebugMode){
  //   print(message);
  // }
}

void navigatePushAndRemoveUntil(BuildContext context, Widget screen) async {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 1000),
      pageBuilder: (_, _, _) => screen,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    (Route<dynamic> route) => false, // removes all previous routes
  );
}

class AppDimen {
  static const double smallRadius = 20;

  static double radius = 30;
  static double circleRadius = 14;
  static const double buttonRadius = 8.0;

  static const double iconRadius = 60.0;
  static const double logoIconSize = 185.0;
  static const double iconSize = 32;

  static const EdgeInsets buttonPadding = EdgeInsets.all(16.0);
  static const EdgeInsets screenPadding = EdgeInsets.all(20);

  // static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(90));

  static const double paddingExtraSmall = 6.0;
  static const double paddingSmall = 8.0;
  static const double padding = 16.0;
  static const double paddingLarge = 20.0;
  static const double paddingExtraLarge = 30.0;
}
