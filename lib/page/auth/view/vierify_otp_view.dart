import 'package:dinogreenv1/page/auth/viewmodels/verify_otp_view_model.dart';
import 'package:dinogreenv1/page/auth/widgets/otp_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VierifyOtpView extends StatelessWidget {

  final VerifyOtpController _controller = Get.put(VerifyOtpController());
  VierifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green.shade50,
                child: Image.asset("assets/images/logo.png",scale: 3,),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric( horizontal: 24,vertical: 12),
              decoration: BoxDecoration(
              ),
              child: Column(
                children: [
                  SizedBox(height: 12,),
                  Text("Enter Verification Code",style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "DMSan"
                  )),
                  SizedBox(height: 12,),
                  Text("Enter the OTP which is send to your mailing Number ${_controller?.phoneNumber?.value}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "DMSan"
                  ),),
                  SizedBox(height: 24,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: List.generate(6, (index) => OtpTextField(controller: _controller,index: index,)),
                  ),
                  SizedBox(height: 24,),
                   Obx(() =>  RichText(text: TextSpan(
                       children: [
                         TextSpan(
                             text: "Didn't receive OTP? ",
                             style: TextStyle(
                               color: Colors.black,
                               fontFamily: "DMSan",
                               fontSize: 14,)
                         ),

                         _controller.canResend.value ? TextSpan(
                           text: "Resend",
                           style: TextStyle(
                             color: Colors.blue,
                             fontWeight: FontWeight.bold,
                           ),
                           recognizer: TapGestureRecognizer()
                             ..onTap = () {
                               _controller.resendOTP();
                             },
                         )
                             : TextSpan(
                           text: "Resend in ${_controller.seconds.value}s",
                           style: TextStyle(color: Colors.grey),
                         ),

                       ]
                   )),),
                  SizedBox(height: 24,),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade500,
                      ),
                      onPressed: _controller.verifyOtp,
                      child: Text("Verify & Preceed",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "DMSan",
                        fontSize: 18
                      ),),),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
