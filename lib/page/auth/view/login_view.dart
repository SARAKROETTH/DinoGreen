import 'package:country_code_picker/country_code_picker.dart';
import 'package:dinogreenv1/page/auth/viewmodels/login_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class LoginView extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());
  LoginView({super.key});

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green.shade50,
                child: Image.asset("assets/images/logo.png",scale: 3,),
              ),
            ),
            SizedBox(height: 12),
            Text(" Enter Your Number",style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              fontFamily: "DMSan"
            )),
            SizedBox(height: 12),
            Text(" We will send you a verification code",style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontFamily: "DMSan"
            ),),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric( horizontal: 24,vertical: 12),
              decoration: BoxDecoration(

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CountryCodePicker(
                    onChanged: (value){
                      _controller.setInputCountry(value.toString());
                    },
                    initialSelection: "KH",
                    showCountryOnly: false,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black
                    ),
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontFamily: "DMSan",
                        ),
                        controller: _controller.inputNumberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        decoration: InputDecoration(
                          hintText:" 000 000 000",
                          hintStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.grey.shade500,
                            fontFamily: "DMSan",
                            fontWeight: FontWeight.w100
                          ),
                          border: InputBorder.none
                        ),
                      )
                  )


                ],
              ),
            ),
            SizedBox(height: 24,),
            ElevatedButton(
                onPressed: (){
                  _controller.submitNumber();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.4,vertical: 23),
                  backgroundColor: Colors.green.shade500,
                ),
                child: Text("Contine",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "DMSan",
                  fontSize: 16
                ),)
            ),
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.symmetric( horizontal: 39,vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(

              ),
              child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "By clicking on “Continue” you are agreeing to our ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                        ),
                        children: [
                          TextSpan(
                            text: "terms of use ",
                            style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                      },
                    ),
                  ]

                )),
              ),
            )


          ],
        ),
      ),
    );
  }
}
