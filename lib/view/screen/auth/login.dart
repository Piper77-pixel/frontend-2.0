import 'package:brain_bucks/core/controller/auth_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/utils/validator.dart';
import 'package:brain_bucks/view/screen/auth/sign_up.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/common_text_field.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  AuthController authController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              authTitleRow(AppString.kLogin.tr),
              verticalSpace(20),
              CommonTextField(
                controller: authController.newEmailController,
                hintText: AppString.kEmailAddress.tr,
                validator: (v) {
                  return Validator.validateEmail(v);
                },
                keyboardType: TextInputType.emailAddress,
                // autofocus: true,
              ),
              CommonTextField(
                controller: authController.newPasswordController,
                hintText: AppString.kPassword.tr,
                validator: (v) {
                  return Validator.validatePassword(v);
                },
                keyboardType: TextInputType.visiblePassword,
                suffix: IconButton(
                  icon: Image.asset(authController.isNewObscure.value ? DefaultImages.eyeIcon : DefaultImages.offEyeIcon, color: AppColors.kText),
                  onPressed: () {
                    authController.isNewObscure.value = !authController.isNewObscure.value;
                  },
                ),
                obscureText: authController.isNewObscure.value,
                obscuringCharacter: '*',
                bottom: 0,
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: authController.isRemember.value,
                          onChanged: (value) {
                            authController.isRemember.value = value!;
                          },
                          activeColor: AppColors.kThemeFont,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4)),
                        ),
                      ),
                      horizontalSpace(12),
                      Text(AppString.kRememberMe.tr, style: pRobotoRegular10.copyWith(fontSize: 14)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      authController.isForgotPassword.value = true;
                    },
                    child: Text(AppString.kForgotPassword.tr, style: pRobotoRegular10.copyWith(fontSize: 12, color: AppColors.kThemeFont)),
                  ),
                ],
              ),
              verticalSpace(32),
              CommonThemeButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (formKey.currentState!.validate()) {
                    Prefs.setAccessToken("token");
                    navigatePushAndRemoveUntil(context, DashboardManager());
                  }
                },
                title: AppString.kLOGIN.tr,
                icon: DefaultImages.loginIcon,
              ),
              verticalSpace(20),
              Row(
                children: [
                  dottedBorderWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppString.kOr.tr, style: pRobotoBold10.copyWith(fontSize: 16)),
                  ),
                  dottedBorderWidget(),
                ],
              ),
              verticalSpace(20),
              CommonButton(icon: DefaultImages.googleIcon, title: AppString.kContinueWithGoogle, onPressed: () {}, textColor: AppColors.kHex1E0C3C, btnColor: AppColors.kWhite, radius: 11),
              verticalSpace(16),
              CommonButton(icon: DefaultImages.appleIcon, title: AppString.kContinueWithGoogle, onPressed: () {}, textColor: AppColors.kFont, btnColor: AppColors.kLightBg, radius: 11),
              verticalSpace(16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: AppString.kDontHaveAc.tr, style: pRobotoRegular10.copyWith(fontSize: 16)),
                    TextSpan(
                      text: AppString.kSignUp.tr,
                      style: pRobotoMedium10.copyWith(color: AppColors.kText, fontSize: 16, decoration: TextDecoration.underline, decorationColor: AppColors.kText, decorationThickness: 1.5),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          authController.isSignUp.value = true;
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget dottedBorderWidget() {
  return Expanded(
    child: DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: AppColors.cDivider,
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    ),
  );
}

Widget authTitleRow(String title,{Function()?onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap:onTap?? () {
          Get.back();
        },
        child: assetImage(DefaultImages.closeIcon, h: 32, w: 32),
      ),
      Expanded(
        child: Center(child: Text(title, style: pRobotoMedium10.copyWith(fontSize: 20))),
      ),
    ],
  );
}
