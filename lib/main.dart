import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp_2/Screen/HomePage/View/Home_Page.dart';
import 'package:todoapp_2/Screen/HomePage/View/Second_Page.dart';
import 'package:todoapp_2/Screen/Login_Screen/View/Login_Page.dart';
import 'package:todoapp_2/Screen/Login_Screen/View/time_Page.dart';

import 'Screen/Login_Screen/View/Sinup_Page.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(p0) => Time_Page(),
            'Login':(p0) => Login_Screen(),
            'sigh':(p0) => Signup_Screen(),
            'page':(p0) => HomePage(),
            'Home':(p0) => Secondpage(),
          },
        );
      },
    ),
  );
}
