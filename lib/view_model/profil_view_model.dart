import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/helper/local_storage_data.dart';

class ProfilViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.put(LocalStorageData());

  ValueNotifier get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel get userModel => _userModel;
  UserModel _userModel;

  Icon _icon = Icon(Icons.visibility);
  Icon get icon => _icon;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      _loding.value = true;
      await localStorageData.getUser.then((value) {
        _userModel = value;
        print('rah--------------');
        print(_userModel.role);
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

  changeIcon() {
    if (_obscureText == true) {
      _icon = Icon(Icons.visibility_off);
      _obscureText = false;
    } else {
      _icon = Icon(Icons.visibility);
      _obscureText = true;
    }
    update();
  }
}
