import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/Model/panier_product_model.dart';
import 'package:pieca/Model/product_model.dart';
import 'package:pieca/service/database/panier_Database.dart';
import 'package:pieca/view_model/home_view_model.dart';

class PanierViewModel extends GetxController {
  ValueNotifier get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  List<PanierProductModel> _listofproduct = [];
  List<PanierProductModel> get listofproduct => _listofproduct;

  double _total = 0;
  double get total => _total;

  PanierViewModel() {
    getproduct();
  }

  gettotalprice() async {
    double p = 0;
    _listofproduct.forEach((element) {
      p = p + element.prix * element.qte;
    });
    _total = p;
    update();
  }

  getproduct() async {
    this._loding.value = true;
    var dbClient = PanierDatabase.db;
    try {
      _listofproduct = await dbClient.getAllProducts();
      update();
      gettotalprice();
      print(_listofproduct.length);
    } catch (e) {
      print(e);
    }
    this._loding.value = false;
  }

  // ignore: non_constant_identifier_names
  AddProduct(PanierProductModel model) async {
    if (_listofproduct.length == 0) {
      Add(model);
      getproduct();
    } else {
      // ignore: unrelated_type_equality_checks
      if (CheckProductExist(_listofproduct, model)) {
        Add(model);
        getproduct();
      } else {
        Get.snackbar(
          'Annonce déja ajouter au panier !!',
          '',
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
    update();
  }

  Add(PanierProductModel model) {
    try {
      PanierDatabase.db.insert(model);
      update();
      Get.snackbar(
        'Annonce ajouter au panier !!',
        '',
        colorText: Colors.blue,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {}
  }

  bool CheckProductExist(
      List<PanierProductModel> list, PanierProductModel model) {
    for (var i = 0; i < list.length; i++) {
      if (list[i].idProduct == model.idProduct) {
        print('hhhhhhh');
        return false;
      }
    }
    return true;
  }

  increaseQte(int index, int max) {
    if (_listofproduct[index].qte < max) {
      _listofproduct[index].qte++;
      _total = _total + _listofproduct[index].prix;
      update();
      updatePanier(_listofproduct[index]);
      update();
      //getproduct();
    }
  }

  decreaseQte(int index) {
    if (_listofproduct[index].qte > 1) {
      _listofproduct[index].qte--;
      _total = _total - _listofproduct[index].prix;
      update();
      updatePanier(_listofproduct[index]);
      //getproduct();
    }
  }

  updatePanier(PanierProductModel product) async {
    try {
      final dbClient = PanierDatabase.db;
      await dbClient.update(product);
      update();
    } catch (e) {
      print(e);
    }
  }

  deletProductfromPanier(PanierProductModel product) async {
    try {
      final dbClient = PanierDatabase.db;
      await dbClient.delete(product);
      update();
      getproduct();
    } catch (e) {
      print(e);
    }
  }

  RecherchProductModel(String id) async {
    await HomeViewModel().getPRoduct();

    try {
      List<ProductModel> list = await HomeViewModel().productModel;
      print('lenght egale  :::::::: ' + list.length.toString());
      for (var i = 0; i < list.length; i++) {
        if (list[i].idProduct == id) {
          print('l9inah');
          print(list[i].image);
          //return list[i];
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
