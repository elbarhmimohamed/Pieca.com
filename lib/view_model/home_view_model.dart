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

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  HomeViewModel() {
    getCategory();
    getPRoduct();
    //getprod();
  }

  getCategory() async {
    //_loding.value = true;
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
    //_loding.value = false;
  }

  void getPRoduct() async {
    print("dkhel1");
    _loding.value = true;
    Homeservice().getProduct().then((value) {
      print("dkhel2");

      _productModel = value.map((e) => ProductModel.fromJson(e)).toList();

      print('product lenght = ' + _productModel.length.toString());
      update();

      _loding.value = false;
    });
  }

  getprod() {
    //_loding.value = true;
    ProductModel prod = new ProductModel(
        //idProduct: '1',
        name: 'moteur',
        image:
            "https://firebasestorage.googleapis.com/v0/b/pieca-daa64.appspot.com/o/mm.png?alt=media&token=116ebd31-3c85-48c3-bd3f-cbc5c5c6883d",
        descreption: 'azerty',
        prix: 1000,
        stock: 100);
    this._productModel.add(prod);
    update();
    //_loding.value = true;
  }
}
