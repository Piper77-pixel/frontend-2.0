import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/core/controller/auth_controller.dart';
import 'package:brain_bucks/view/widgets/common_text_field.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/utils/validator.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

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
              authTitleRow(AppString.kRegister.tr),
              verticalSpace(20),
              CommonTextField(
                controller: authController.nameController,
                hintText: AppString.kEnterName.tr,
                validator: (v) {
                  return Validator.validateName(v, AppString.kUsername.tr);
                },
                keyboardType: TextInputType.emailAddress,
                suffix: IconButton(
                  icon: Image.asset(authController.isUserObscure.value ? DefaultImages.eyeIcon : DefaultImages.offEyeIcon, color: AppColors.kText),
                  onPressed: () {
                    authController.isUserObscure.value = !authController.isUserObscure.value;
                  },
                ),
                obscureText: authController.isUserObscure.value,
                obscuringCharacter: '*',
                // autofocus: true,
              ),
              CommonTextField(
                controller: authController.emailController,
                hintText: AppString.kEmailAddress.tr,
                validator: (v) {
                  return Validator.validateEmail(v);
                },
                keyboardType: TextInputType.emailAddress,
                // autofocus: true,
              ),
              CommonTextField(
                controller: authController.passwordController,
                hintText: AppString.kPassword.tr,
                validator: (v) {
                  return Validator.validatePassword(v);
                },
                keyboardType: TextInputType.visiblePassword,
                suffix: IconButton(
                  icon: Image.asset(authController.isObscure.value ? DefaultImages.eyeIcon : DefaultImages.offEyeIcon, color: AppColors.kText),
                  onPressed: () {
                    authController.isObscure.value = !authController.isObscure.value;
                  },
                ),
                obscureText: authController.isObscure.value,
                obscuringCharacter: '*',
              ),
              CommonTextField(
                controller: authController.rePasswordController,
                hintText: AppString.kConfirmPassword.tr,
                validator: (v) {
                  return Validator.validatePassword(v);
                },
                keyboardType: TextInputType.visiblePassword,
                suffix: IconButton(
                  icon: Image.asset(authController.isReObscure.value ? DefaultImages.eyeIcon : DefaultImages.offEyeIcon, color: AppColors.kText),
                  onPressed: () {
                    authController.isReObscure.value = !authController.isReObscure.value;
                  },
                ),
                obscureText: authController.isReObscure.value,
                obscuringCharacter: '*',
                bottom: 0,
              ),
              verticalSpace(32),
              CommonThemeButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  // if (formKey.currentState!.validate()) {
                  authController.isGetCode.value = true;
                  // }
                },
                title: AppString.kGetACode.tr,
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
                    TextSpan(text: AppString.kExistingUser.tr, style: pRobotoRegular10.copyWith(fontSize: 16)),
                    TextSpan(
                      text: AppString.kSignIn.tr,
                      style: pRobotoMedium10.copyWith(color: AppColors.kText, fontSize: 16,     decoration: TextDecoration.underline,
                        decorationColor: AppColors.kText,
                        decorationThickness: 1.5,),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          authController.isSignUp.value = false;
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
