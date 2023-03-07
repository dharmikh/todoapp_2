import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Time_Page extends StatefulWidget {
  const Time_Page({Key? key}) : super(key: key);

  @override
  State<Time_Page> createState() => _Time_PageState();
}

class _Time_PageState extends State<Time_Page> {
  @override
  void initState() {
    Timer(Duration(seconds:9),() {
      Get.offNamed('Login');
    },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: 40.h,
              width: 70.w,
              // color: Colors.white,
              child: Lottie.asset("assets/lotti/history.json"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 15.h,
              width: 80.w,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Text(
                  "WELCOME",
                  style: GoogleFonts.teko(fontSize: 100, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: 10.h,
              width: 80.w,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Text(
                  "  Nice to see you again!",
                  style: GoogleFonts.teko(fontSize: 35, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 6.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 6.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white,width: 2),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
