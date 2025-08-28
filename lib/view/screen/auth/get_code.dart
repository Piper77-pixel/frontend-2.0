import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/core/controller/auth_controller.dart';
import 'package:brain_bucks/view/widgets/common_text_field.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetCode extends StatelessWidget {
  GetCode({super.key});

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        authTitleRow(AppString.kOneTimePassword.tr),
        verticalSpace(20),
        Text(AppString.kEnterYourDigitCode.tr, style: pRobotoMedium10.copyWith(fontSize: 18)),
        verticalSpace(16),
        CommonTextField(
          controller: authController.otpController,
          maxLength: 11, // 6 digits + 5 dashes
          hintText: '0-0-0-0-0-0',
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          fontSize: 20,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
            OtpDashFormatter(), // 👈 custom formatter
          ],
          bottom: 0,
        ),
        verticalSpace(16),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Text(AppString.kResendCode.tr, style: pRobotoRegular10.copyWith(fontSize: 12, color: AppColors.kThemeFont)),
          ),
        ),
        verticalSpace(16),
        CommonThemeButton(
          onPressed: () {
            String otp = authController.otpController.text.replaceAll('-', '');

            showMessage("OTP--->$otp=${otp.isNotEmpty}");
            if (otp.isNotEmpty) {
              Prefs.setAccessToken("token");
              navigatePushAndRemoveUntil(context, DashboardManager());
            }
          },
          title: AppString.kSend.tr,
        ),
      ],
    );
  }
}

class OtpDashFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll('-', '');
    if (digitsOnly.length > 6) {
      digitsOnly = digitsOnly.substring(0, 6);
    }

    // Insert dash between every digit
    String formatted = digitsOnly.split('').join('-');

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
