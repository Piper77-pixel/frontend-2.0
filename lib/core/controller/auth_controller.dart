import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  TextEditingController otpController = TextEditingController();

  TextEditingController forgotEmailController = TextEditingController();

  RxBool isGetCode = false.obs;
  RxBool isForgotPassword = false.obs;
  RxBool isSignUp = false.obs;
  RxBool isRemember = true.obs;
  RxBool isUserObscure = true.obs;
  RxBool isNewObscure = true.obs;
  RxBool isObscure = true.obs;
  RxBool isReObscure = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isSignUp.value = false;
    isGetCode.value = false;
    isForgotPassword.value = false;
  }

  clear() {
    isForgotPassword.value = false;
    isSignUp.value = false;
    isGetCode.value = false;
    newEmailController.clear();
    newPasswordController.clear();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    rePasswordController.clear();
    otpController.clear();
    forgotEmailController.clear();
  }
}
