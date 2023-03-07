import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp_2/Screen/HomePage/Model/Home_Model.dart';

Future<void> CreatData({required String email, required String pass}) async {
  SharedPreferences Pref = await SharedPreferences.getInstance();
  Pref.setString("e1", email);
  Pref.setString("p1", pass);
}

Future<Home_Model> readData() async {
  SharedPreferences Pref = await SharedPreferences.getInstance();

  Home_Model m1 =
      Home_Model(emial: "${Pref.get("e1")}", pass: "${Pref.get("p1")}");
  return m1;
}
