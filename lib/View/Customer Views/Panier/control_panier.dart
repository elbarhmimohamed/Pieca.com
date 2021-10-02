import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pieca/View/Auth/login.dart';
import 'package:pieca/View/Customer%20Views/Panier/panier_view.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/view_model/auth_View_Model.dart';

class ControlPanier extends GetWidget<AuthViewModel> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/cart1.svg',
                    width: size.width * .6,
                  ),
                  SizedBox(
                    height: size.height * .06,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff1e88e5),
                    ),
                    width: size.width * .5,
                    height: size.height * .06,
                    child: FlatButton(
                      child: CustomText(
                        text: 'Connexion',
                        fontSize: 20,
                        alignment: Alignment.center,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.offAll(() => Login_View());
                      },
                    ),
                  ),
                ],
              ),
            ))
          : PanierView();
    });
  }
}
