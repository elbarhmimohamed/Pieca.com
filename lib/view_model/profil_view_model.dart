import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/helper/local_storage_data.dart';
import 'package:pieca/view_model/auth_View_Model.dart';
import 'package:pieca/view_model/home_view_model.dart';

class ProfilViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.put(LocalStorageData());

  ValueNotifier get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  @override
  void onInit() async {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      _loding.value = true;
      await localStorageData.getUser.then((value) {
        _userModel = value;
        update();
      });
      _loding.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deletUser();
  }
}
