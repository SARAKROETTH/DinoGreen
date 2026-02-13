import 'package:dinogreenv1/page/auth/viewmodels/verify_otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  final VerifyOtpController controller;
  final int index;
  OtpTextField({
    super.key,
    required this.controller,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 50,
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        textAlign: TextAlign.center,
        cursorColor: Colors.green,
        keyboardType: TextInputType.number,
        onChanged: (value)=> controller.onChange(value,index),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                )
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2,
                )
            ),
          border: OutlineInputBorder(

          ),
        ),
      ),
    );
  }
}
