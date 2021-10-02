import 'dart:convert';

import 'package:get/get.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/helper/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await getUserData();

      return userModel;
    } catch (e) {
      print(e.toString());
    }
  }

  getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUserData(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        CACHED_USER_DATA, json.encode(userModel.toMap()));
  }

  void deletUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
