
import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class VerifyOtpController extends GetxController{

  RxInt seconds = 30.obs;
  RxBool canResend = true.obs;

  Timer? _timer;
  var countryCode = "+95".obs;
  var phoneNumber = "".obs;


  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  RxString otp = "".obs;
  // for Box input
  void onChange(String value ,int index){
    if(value.isNotEmpty && index < 5){
      focusNodes[index + 1].requestFocus();
    }
    // if value is empty
    if(value.isEmpty && index > 0){
      focusNodes[index - 1].requestFocus();
    }

    // Paste full OTP
    if (value.length > 1) {
      for (int i = 0; i < 6; i++) {
        otpControllers[i].text = value.length > i ? value[i] : "";
      }
    }

    otp.value = otpControllers.map((e) => e.text).join();

  }
  // for button verify
  void verifyOtp() {
    otp.value = otpControllers.map((e) => e.text).join();

    if (otp.value.length == 6) {
      Get.snackbar("Success", "OTP: ${otp.value}");
    } else {
      Get.snackbar("Error", "Please enter full OTP");
    }
  }
  // for resend text span
  void startCountdown(){
    canResend.value = false;
    seconds.value = 30;
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1),(timer){
      if(seconds.value > 0){
        seconds.value--;

      }else{
        canResend.value = true;
        timer.cancel();

      }

    });


  }

  void resendOTP(){
    if (!canResend.value) return;
    startCountdown();

  }


  @override
  void onInit() {
    countryCode.value = Get.arguments["country"].toString();
    phoneNumber.value = Get.arguments["number"].toString();
    // TODO: implement onInit
    startCountdown();
    super.onInit();
  }



  @override
  void onClose() {
    // TODO: implement onClose
    for (int i = 0; i < 6; i++) {
      otpControllers[i].dispose();
      focusNodes[i].dispose();
    }
    _timer?.cancel();

    super.onClose();
  }


}