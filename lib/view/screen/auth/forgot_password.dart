import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/core/controller/auth_controller.dart';
import 'package:brain_bucks/view/widgets/common_text_field.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        authTitleRow(
          AppString.kForgotPasswordTitle.tr,
          onTap: () {
            authController.clear();
          },
        ),
        verticalSpace(20),
        Text(AppString.kEnterYourEmailAddressToResetYourPassword.tr, style: pRobotoMedium10.copyWith(fontSize: 18), textAlign: TextAlign.center),
        verticalSpace(16),
        CommonTextField(
          controller: authController.forgotEmailController,
          hintText: AppString.kEmailAddress.tr,
          validator: (v) {
            return Validator.validateEmail(v);
          },
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace(16),
        CommonThemeButton(
          onPressed: () {
            authController.clear();
          },
          title: AppString.kSend.tr,
        ),
      ],
    );
  }
}
