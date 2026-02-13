import 'package:dinogreenv1/routes/app_routes.dart';
import 'package:dinogreenv1/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: RouteNames.home,
      getPages: AppRoute.page,
    );
  }
}
