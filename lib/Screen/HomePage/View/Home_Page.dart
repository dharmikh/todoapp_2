import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp_2/Screen/HomePage/Controller/Home_Controller.dart';
import 'package:todoapp_2/utils/DB_Helper/DBhelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  void initState() {
    home_controller.getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: Text(
            "TODO List",
            style: GoogleFonts.actor(fontSize: 30),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                  onTap: () {
                    Get.offNamed('Login');
                  },
                  child: Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.white,
                  )),
            )
          ],
          // title: Container(
          //   decoration: BoxDecoration(
          //       color: Colors.grey.shade200,
          //       borderRadius: BorderRadius.circular(20)),
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 2),
          //     child: TextField(
          //       controller: home_controller.txtsearch.value,
          //       decoration: InputDecoration(
          //         prefixIcon: Icon(
          //           Icons.search_rounded,
          //           color: Colors.grey.shade200,
          //           size: 20,
          //         ),
          //         prefixIconConstraints: BoxConstraints(
          //           maxHeight: 20,
          //           maxWidth: 25,
          //         ),
          //         border: InputBorder.none,
          //         hintText: " Search",
          //         hintStyle: TextStyle(color: Colors.grey),
          //       ),
          //     ),
          //   ),
          // ),
        ),
        body: Obx(
          () => home_controller.dataList.isEmpty
              ? Center(
                  child: Text(
                    "Please Add Your Task",
                    style: TextStyle(fontSize: 25, color: Colors.grey.shade300),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${home_controller.dataList[index]['id']}"),
                      title: Text("${home_controller.dataList[index]['task']}"),
                      subtitle: Text(
                          "${home_controller.dataList[index]['category']}"),
                      trailing: Container(
                        height: 10.h,
                        width: 30.w,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                home_controller.txtsearch.value =
                                    TextEditingController(
                                        text: home_controller.dataList[index]
                                            ['task']);
                                home_controller.txtcategory2.value =
                                    TextEditingController(
                                        text: home_controller.dataList[index]
                                            ['category']);
                                Get.defaultDialog(
                                  title: "Update Your Task",
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller:
                                            home_controller.txtsearch.value,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.edit,
                                            color: Colors.grey.shade200,
                                            size: 20,
                                          ),
                                          prefixIconConstraints: BoxConstraints(
                                            maxHeight: 20,
                                            maxWidth: 25,
                                          ),
                                          border: InputBorder.none,
                                          hintText: "Enter Yor Task",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      TextField(
                                        controller:
                                            home_controller.txtcategory2.value,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.edit,
                                            color: Colors.grey.shade200,
                                            size: 20,
                                          ),
                                          prefixIconConstraints: BoxConstraints(
                                            maxHeight: 20,
                                            maxWidth: 25,
                                          ),
                                          border: InputBorder.none,
                                          hintText: "Enter Yor Category",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          DBHelper.dbHelper.updatedata(
                                              id: home_controller
                                                  .dataList[index]['id'],
                                              task: home_controller
                                                  .txtsearch.value.text,
                                              category: home_controller
                                                  .txtcategory2.value.text);
                                          home_controller.getdata();
                                          Get.back();
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
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Icons.edit,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                DBHelper.dbHelper.Deletdata(
                                    id: home_controller.dataList[index]['id']);
                                home_controller.getdata();
                              },
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.yellow,
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    size: 25,
                                    color: Colors.black,
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: home_controller.dataList.length,
                ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            home_controller.txttask.value.clear();
            home_controller.txtcategory.value.clear();
            Get.toNamed('Home');
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.red,
                  Colors.red,
                  Colors.red,
                ],
              ),
            ),
            child: Icon(
              Icons.add,
              size: 30.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
