import 'package:dinogreenv1/page/auth/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';

class VierifyOtpView extends StatelessWidget {
  const VierifyOtpView({super.key});

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
                  Text("Enter the OTP which is send to your mailing Number 95471411",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "DMSan"
                  ),),
                  SizedBox(height: 24,),
                  OtpTextField()

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
