import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_2/Screen/HomePage/Controller/Home_Controller.dart';
import 'package:todoapp_2/utils/DB_Helper/DBhelper.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  void initState() {
    super.initState();
    home_controller.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 89.w),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            )
          ],
          elevation: 0,
          title: Text(""),
        ),
        body: Form(
          key: home_controller.taskkey.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Your Task";
                                    }
                                  },
                                  controller: home_controller.txttask.value,
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          top: 2, left: 8, bottom: 2),
                                      child: Icon(
                                        Icons.search_rounded,
                                        color: Colors.grey.shade200,
                                        size: 20,
                                      ),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      maxHeight: 20,
                                      maxWidth: 25,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Your Task",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your Category";
                                      }
                                    },
                                    controller: home_controller.txtcategory.value,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            top: 2, left: 8, bottom: 2),
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: Colors.grey.shade200,
                                          size: 20,
                                        ),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        maxHeight: 20,
                                        maxWidth: 25,
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Yor Category",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InkWell(
                              onTap: () {
                                if (home_controller.taskkey.value.currentState!
                                    .validate()) {
                                  DBHelper.dbHelper.insertDB(
                                      task: home_controller.txttask.value.text,
                                      category: home_controller
                                          .txtcategory.value.text);
                                  home_controller.getdata();
                                  Get.back();
                                }
                              },
                              child: Container(
                                height: 6.h,
                                width: 30.w,
                                child: Center(
                                    child: Text(
                                  "Add",
                                  style: GoogleFonts.actor(),
                                )),
                                decoration: BoxDecoration(
                                    color: Colors.yellowAccent,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
