import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp_2/Screen/HomePage/Controller/Home_Controller.dart';
import 'package:todoapp_2/utils/shared_pref/Shared_Pref.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w),
                    child: Text(
                      "Creat Account",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 35),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 25.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Task";
                                }
                              },
                              controller: home_controller.txtname.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.grey.shade200,
                                  size: 20,
                                ),
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20,
                                  maxWidth: 25,
                                ),
                                border: InputBorder.none,
                                hintText: "Enter Your Name",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Task";
                                }
                              },
                              controller: home_controller.txtSinup_name.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.grey.shade200,
                                  size: 20,
                                ),
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20,
                                  maxWidth: 25,
                                ),
                                border: InputBorder.none,
                                hintText: "Enter Your Email",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Task";
                                }
                              },
                              controller: home_controller.txtSinup_pass.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.grey.shade200,
                                  size: 20,
                                ),
                                suffixIcon: Icon(
                                  Icons.password,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20,
                                  maxWidth: 25,
                                ),
                                border: InputBorder.none,
                                hintText: "Enter Your Password",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InkWell(onTap: () {
                            CreatData(
                                email: home_controller.txtSinup_name.value.text,
                                pass: home_controller.txtSinup_pass.value.text);
                            Get.offNamed('Login');
                          },
                            child: Container(
                              height: 6.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: 35.w,
                                color: Colors.white,
                              ),
                              Text(
                                " or logi with ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                height: 1,
                                width: 35.w,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 6.h,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Image.asset(
                                      "assets/image/google (2).png",
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 6.h,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      // color: Colors.white
                                    ),
                                    child: Image.asset(
                                      "assets/image/facebook (2).png",
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don`t have Account?",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed('Login');
                                },
                                child: Text(
                                  " Sign Up",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
