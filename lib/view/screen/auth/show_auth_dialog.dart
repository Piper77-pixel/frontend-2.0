import 'package:brain_bucks/view/screen/auth/forgot_password.dart';
import 'package:brain_bucks/core/controller/auth_controller.dart';
import 'package:brain_bucks/view/screen/auth/get_code.dart';
import 'package:brain_bucks/view/screen/auth/sign_up.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

showLoginSignupDialog(BuildContext context) {
  showMessage("Not Logged in ❌");
  showDialog(
    context: context,
    // barrierColor: AppColors.kOpacityBackGround,
    barrierDismissible: false,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(AppDimen.padding),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimen.radius)),
          content: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.kBackGround,
              borderRadius: BorderRadius.circular(AppDimen.smallRadius),
              image: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
            ),
            padding: EdgeInsets.all(AppDimen.padding),
            child: AuthView(),
          ),
        ),
      );
    },
  );
}

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authController.isForgotPassword.value
          ? ForgotPassword()
          : authController.isGetCode.value
          ? GetCode()
          : authController.isSignUp.value
          ? Signup()
          : Login(),
    );
  }
}
