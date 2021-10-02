import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pieca/View/Auth/login.dart';
import 'package:pieca/View/Auth/Signup/signup.dart';
import 'package:pieca/View/Customer%20Views/Panier/panier_view.dart';
import 'package:pieca/View/Customer%20Views/Profil/profil.dart';
import 'package:pieca/View/home/components/body.dart';

final Map<String, WidgetBuilder> routes = {
  Login_View.routename: (context) => Login_View(),
  Signup_View.routename: (context) => Signup_View(),
  PanierView.routename: (context) => PanierView(),
  ProfilView.routename: (context) => ProfilView(),
  MyhomBbody.routename: (context) => MyhomBbody(),
};
