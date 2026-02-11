

import 'package:dinogreenv1/page/auth/view/vierify_otp_view.dart';
import 'package:dinogreenv1/page/homeScreen/view/home_view.dart';
import 'package:dinogreenv1/routes/route_names.dart';
import 'package:get/get.dart';

import '../page/auth/view/login_view.dart';

class AppRoute{
 static final List<GetPage> page = [
   GetPage(name: RouteNames.home,page: () => HomeScreen() ),
   GetPage(name: RouteNames.login, page: () => LoginView()),
   GetPage(name: RouteNames.otpVerify, page: () => VierifyOtpView())
 ];


}