import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/Model/adress_model.dart';
import 'package:pieca/Model/commande_model.dart';
import 'package:pieca/Model/panier_product_model.dart';
import 'package:pieca/Model/product_model.dart';
import 'package:pieca/Model/user_model.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/constant.dart';
import 'package:pieca/helper/local_storage_data.dart';
import 'package:pieca/service/home_service.dart';
import 'package:pieca/view_model/panier_view_model.dart';

class CommandeViewModel extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    getCurrentUser();
    changgetstatusofbutton(true);
    getPrixTotal();
  }

  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final PanierViewModel panierViewModel = Get.put(PanierViewModel());

  String name, tele, adress, city, code;
  GlobalKey<FormState> globalKey = GlobalKey();

  int get index => _index;
  int _index = 0;

  double get prixTotal => _prixTotal;
  double _prixTotal = 0;

  bool _switchval = false;
  bool get switchval => _switchval;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  Icon _icon = Icon(Icons.watch_later, color: Color(0xff709BE4));
  Icon get icon => _icon;

  Delivry _delivry = Delivry.StandrdDelivry;
  Delivry get delivry => _delivry;

  String _delivrychose = 'Livraison Standard';
  String get delivrychose => _delivrychose;

  bool _isok = false;
  bool get isok => _isok;

  bool _getstatusofbutton = true;
  bool get getstatusofbutton => _getstatusofbutton;

  ValueNotifier get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  UserModel get userModel => _userModel;
  UserModel _userModel;

  AdressModel get adressModel => _adressModel;
  AdressModel _adressModel;
  DateTime valuedate;

  // ignore: must_call_super

  changgetstatusofbutton(value) {
    try {
      _getstatusofbutton = value;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void getPrixTotal() {
    _prixTotal = panierViewModel.total;
    update();
  }

  void changeindex(int i) {
    switch (i) {
      case 0:
        _pages = Pages.DeliveryTime;
        _index = i;
        _icon = Icon(Icons.watch_later, color: Color(0xff709BE4));
        update();
        break;
      case 1:
        _pages = Pages.AddAddress;
        _index = i;
        _icon = Icon(Icons.place, color: Color(0xff709BE4));
        update();
        break;
      case 2:
        globalKey.currentState.save();
        if (globalKey.currentState.validate()) {
          saveCommandeData();
          _pages = Pages.payement;
          _index = i;
          _icon = Icon(Icons.paid, color: Color(0xff709BE4));
          update();
        }
        break;
      case 3:
        _pages = Pages.Commande;
        _index = i;
        _icon = Icon(Icons.inventory_outlined, color: Color(0xff709BE4));
        update();
        break;
      case 4:
        _index = 0;
        _pages = Pages.DeliveryTime;
        _index = i;
        _icon = Icon(Icons.watch_later, color: Color(0xff709BE4));
        //Get.offAll(() => HomeView());
        //livraisonViewMolde.init();
        update();
        break;
      default:
    }
  }

  void changeindexdec(int i) {
    switch (i) {
      case 0:
        _index = i;
        _pages = Pages.DeliveryTime;
        _icon = Icon(Icons.watch_later, color: Color(0xff709BE4));
        update();
        break;
      case 1:
        _index = i;
        _pages = Pages.AddAddress;
        _icon = Icon(Icons.place, color: Color(0xff709BE4));
        update();
        break;
      case 2:
        _index = i;
        _pages = Pages.payement;
        _icon = Icon(Icons.paid, color: Color(0xff709BE4));
        update();
        break;

      default:
    }
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Color(0xff709BE4);
    } else {
      return todoColor;
    }
  }

  changSwitchVal(val) {
    _switchval = val;
    update();
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

  void saveCommandeData() {
    _adressModel = AdressModel(
        name: name, adress: adress, tele: tele, city: city, code: code);
    update();
    print(_adressModel.name);
  }

  changdIsOk(value) {
    _isok = value;
    update();
  }

  changdelivry(value) {
    _delivry = value;
    update();
  }

  changdelivrychose(value) {
    if (value == Delivry.StandrdDelivry) {
      _delivrychose = '  entre 3 et 5 jours';
      changgetstatusofbutton(true);
      //summaryViewModel.setDelivryMode('Livraison entre 3 et 5 jours');
      update();
    } else {
      if (value == Delivry.NextDay) {
        _delivrychose = ' dans 48 h';
        changgetstatusofbutton(true);

        //summaryViewModel.setDelivryMode('Livraison dans 48 h');
        update();
      } else {
        if (value == Delivry.Delivrychoosing) {
          _delivrychose = '';
          //changgetstatusofbutton(false);

          update();
        } else {
          _delivrychose = value;
          changgetstatusofbutton(true);
          //summaryViewModel.setDelivryMode('date de livraison : ' + value);
          update();
        }
      }
    }
  }

  //-----------------------------

  List<PanierProductModel> _listofproduct;
  List<PanierProductModel> get listofproduct => _listofproduct;

  List<String> _listofidofproduct;
  List<String> get listofidofproduct => _listofidofproduct;

  void getListofProduct() {
    _listofproduct = panierViewModel.listofproduct;
    update();
  }

  DateTime today = new DateTime.now();
  //------------------------------

  //-----------------------------
  saveCmd() async {
    await getListofProduct();
    await getCurrentUser();
    CommandeModel commandeModel = CommandeModel(
      idCmd: genererID(),
      idUserCmd: userModel.userId,
      date: today.toString(),
      listofidofproduct: listofproduct,
      prix: prixTotal,
    );
    Homeservice().addCmdToFirebase(commandeModel);
    Get.offAll(() => HomeView());
  }

  //-------------------------------
  String genererID() {
    String Caracters = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String RandomString = "";
    int lengthS = 20;
    Random rand = new Random();
    var text;

    for (var i = 0; i < 20; i++) {
      RandomString += Caracters[rand.nextInt(lengthS)];
    }
    return RandomString;
  }
  //--------------------------------

}
