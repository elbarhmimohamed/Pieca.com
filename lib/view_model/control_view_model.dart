import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Contact/contact.dart';
import 'package:pieca/View/Customer%20Views/Panier/control_panier.dart';
import 'package:pieca/View/Customer%20Views/Profil/profil.dart';
import 'package:pieca/View/infos/info.dart';
import 'package:pieca/view_model/home_view_model.dart';

import '../View/home/components/body.dart';

class HomeViewCoontroller extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget _currentScreen = MyhomBbody();

  get currentScreen => _currentScreen;

  void ChangeSelectedValue(int SelectedValue) {
    _navigatorValue = SelectedValue;
    switch (SelectedValue) {
      case 0:
        _currentScreen = MyhomBbody();
        break;
      case 1:
        _currentScreen = ControlPanier();
        break;
      case 2:
        _currentScreen = ContactView();
        break;
      case 3:
        _currentScreen = ProfilView();
        break;
    }
    update();
  }
}
