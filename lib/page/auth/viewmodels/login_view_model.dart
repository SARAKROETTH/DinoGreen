import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../routes/route_names.dart';

class LoginController extends GetxController{

  final inputNumberController  =TextEditingController();
  final inputCountryController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void setInputCountry(String Code ){
    inputCountryController.text = Code;
  }

  void submitNumber (){
    if(inputNumberController.text.isNotEmpty && inputNumberController.text.length >= 8){
      Get.toNamed(RouteNames.otpVerify,
      arguments: {
        "country":inputCountryController.text.toString(),
        "number":inputNumberController.text.toString()
      }
      );
      Get.snackbar("Success", "${inputCountryController.text}  ${inputNumberController.text}");
    }else{
      Get.snackbar("Error","Please Enter Your Number");
    }
  }


}