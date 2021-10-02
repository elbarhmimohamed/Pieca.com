import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pieca/Model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pieca/Model/product_model.dart';
import 'package:pieca/main.dart';

import '../service/home_service.dart';

class HomeViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  ValueNotifier get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getPRoduct();
  }

  getCategory() async {
    _loding.value = true;
    Homeservice().getCategory().then((value) {
      if (value == null) {
        return;
      }
      /////////////////
      _categoryModel = value.map((e) => CategoryModel.fromJson(e)).toList();
      print('category lenght = ' + _categoryModel.length.toString());
      //////////////
      update();
    });
    _loding.value = false;
  }

  getPRoduct() async {
    _loding.value = true;
    Homeservice().getProduct().then((value) {
      if (value == null) {
        return;
      }
      _productModel = value.map((e) => ProductModel.fromJson(e)).toList();

      print('product lenght = ' + _productModel.length.toString());
      update();
      _loding.value = false;
    });
  }
}
