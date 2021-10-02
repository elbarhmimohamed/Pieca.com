import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Auth/login.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/view_model/auth_View_Model.dart';

// ignore: must_be_immutable

class ContactView extends GetWidget<AuthViewModel> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthViewModel authViewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      // ignore: unnecessary_null_comparison
      return (Get.find<AuthViewModel>().user == null)
          ? Scaffold(
              body: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xff1e88e5),
                  ),
                  width: size.width * .5,
                  height: size.height * .06,
                  child: FlatButton(
                    child: CustomText(
                      text: 'Connexion',
                      fontSize: 18,
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.offAll(Login_View());
                    },
                  ),
                ),
              ),
            )
          : Scaffold(
              body: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xFFA10000),
                  ),
                  width: size.width * .5,
                  height: size.height * .06,
                  child: FlatButton(
                    child: CustomText(
                      text: 'Deconnexion',
                      fontSize: 18,
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _auth.signOut();
                      Get.offAll(() => HomeView());
                    },
                  ),
                ),
              ),
            );
    });
  }
}
