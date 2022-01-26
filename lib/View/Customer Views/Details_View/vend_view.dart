import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pieca/Model/panier_product_model.dart';
import 'package:pieca/Model/product_model.dart';
import 'package:pieca/View/Auth/login.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/main.dart';
import 'package:pieca/view_model/Annonce_View_Model.dart';
import 'package:pieca/view_model/Vend_View_model.dart';
import 'package:pieca/view_model/auth_View_Model.dart';
import 'package:pieca/view_model/panier_view_model.dart';
import 'package:pieca/view_model/profil_view_model.dart';

class VendView extends GetWidget<VendViewModel> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthViewModel authViewModel = Get.find();

  String model;
  VendView({this.model});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold();
  }
}
