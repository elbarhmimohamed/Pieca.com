import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pieca/Model/category_model.dart';
import 'package:pieca/Model/product_model.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/local_storage_data.dart';
import 'package:pieca/service/firestore_user.dart';
import 'package:pieca/service/home_service.dart';

import 'home_view_model.dart';

class VendViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  FirebaseAuth _auth = FirebaseAuth.instance;

  ValueNotifier get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  UserModel _userModel;
  UserModel get userModel => _userModel;

  List<UserModel> _userModell;
  List<UserModel> get userModell => _userModell;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getAlluser() async {
    _loding.value = true;
    FireStoreUser().getUsers().then((value) {
      _userModell = value
          .map((e) => UserModel.fromJson(e as Map<dynamic, dynamic>))
          .toList();
      update();

      _loding.value = false;
    });
  }

  void getUserByID(String id) {
    for (var i = 0; i < _userModell.length; i++) {
      if (_userModell[i].userId == id) {
        _userModel = _userModell[i];
        update();
      }
    }
  }
}
