import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todoapp_2/utils/DB_Helper/DBhelper.dart';

class Home_Controller extends GetxController
{
  Rx<TextEditingController> txtsearch = TextEditingController().obs;
  Rx<TextEditingController> txttask = TextEditingController().obs;
  Rx<TextEditingController> txtcategory = TextEditingController().obs;
  Rx<TextEditingController> txtcategory2 = TextEditingController().obs;
  Rx<TextEditingController> txtLogin_name = TextEditingController().obs;
  Rx<TextEditingController> txtLogin_pass = TextEditingController().obs;
  Rx<TextEditingController> txtSinup_name = TextEditingController().obs;
  Rx<TextEditingController> txtSinup_pass = TextEditingController().obs;
  Rx<TextEditingController> txtname = TextEditingController().obs;
  RxList dataList = [].obs;

  Rx<GlobalKey<FormState>> taskkey = GlobalKey<FormState>().obs;

  Future<void> getdata() async {
    dataList.value = await DBHelper.dbHelper.readDB();
  }
}