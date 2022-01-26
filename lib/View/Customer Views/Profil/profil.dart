import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Auth/login.dart';
import 'package:pieca/View/Customer%20Views/Profil/edit_profil.dart';
import 'package:pieca/View/Customer%20Views/Profil/iconButtonNavigat.dart';
import 'package:pieca/View/Supplier%20Views/annonce.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/view_model/auth_View_Model.dart';
import 'package:pieca/view_model/profil_view_model.dart';

// ignore: must_be_immutable

class ProfilView extends GetWidget<AuthViewModel> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthViewModel authViewModel = Get.find();

  static String routename = "/profil";

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
                    'assets/images/account.svg',
                    width: size.width * .6,
                  ),
                  SizedBox(
                    height: size.height * .06,
                  ),
                  CustomText(
                    text: 'Vous devez connecter pour accéder au service compte',
                    maxLine: 2,
                  ),
                  SizedBox(
                    height: size.height * .06,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff709BE4),
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
          : _Typeaccount(size);
    });
  }

  Widget _Profil(size) {
    return GetBuilder<ProfilViewModel>(
        init: ProfilViewModel(),
        builder: (controller) => controller.loding.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _ContainerAccount(size),
                      SizedBox(
                        height: size.height * .06,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.teal[400],
                        ),
                        text: 'Modifier le compte',
                        onpress: () {
                          Get.to(() => EditProfilView());
                        },
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.inventory_outlined,
                          color: Colors.blueAccent,
                        ),
                        text: 'Mes commandes',
                        onpress: () {},
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.payment,
                          color: Colors.cyan,
                        ),
                        text: 'Ajouter une Carte',
                        onpress: () {},
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      /*
                      IconButtonNavigat(
                        icon: Icon(Icons.add_outlined),
                        text: 'Ajouter une annonce',
                        onpress: () {
                          Get.to(() => AnnonceView());
                        },
                      ),
                      */
                      IconButtonNavigat(
                        icon: Icon(Icons.info_outline),
                        text: 'A propos-nous',
                        onpress: () {
                          Get.to(() => AnnonceView());
                        },
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        text: 'Déconnexion',
                        onpress: () {
                          controller.signOut();
                          Get.offAll(() => Login_View());
                        },
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                    ],
                  ),
                ),
              )));
  }

  Widget _ProfilSupp(size) {
    return GetBuilder<ProfilViewModel>(
        init: ProfilViewModel(),
        builder: (controller) => controller.loding.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _ContainerAccount(size),
                      SizedBox(
                        height: size.height * .06,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.teal[400],
                        ),
                        text: 'Modifier le compte',
                        onpress: () {
                          Get.to(() => EditProfilView());
                        },
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.store_outlined,
                          color: Colors.blueAccent,
                        ),
                        text: 'mon magasin',
                        onpress: () {},
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(Icons.add_outlined),
                        text: 'Ajouter une annonce',
                        onpress: () {
                          Get.to(() => AnnonceView());
                        },
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(Icons.info_outline),
                        text: 'A propos-nous',
                        onpress: () {
                          Get.to(() => AnnonceView());
                        },
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.payment,
                          color: Colors.cyan,
                        ),
                        text: 'Ajouter une Carte',
                        onpress: () {},
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      IconButtonNavigat(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        text: 'Déconnexion',
                        onpress: () {
                          controller.signOut();
                          Get.offAll(() => Login_View());
                        },
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                    ],
                  ),
                ),
              )));
  }

  Widget _Typeaccount(size) {
    return (Get.find<ProfilViewModel>().userModel.role == 'Client')
        ? _Profil(size)
        : _ProfilSupp(size);
  }

  Widget _ContainerAccount(size) {
    return GetBuilder<ProfilViewModel>(
        init: ProfilViewModel(),
        builder: (controller) => Container(
              // color: Colors.amber,
              padding: EdgeInsets.only(
                top: size.height * .08,
                bottom: size.height * .02,
                left: size.width * .04,
              ),
              width: size.width * 1,
              height: size.height * .24,
              child: Row(
                children: [
                  Container(
                      width: size.width * .2,
                      height: size.width * .2,
                      decoration: ShapeDecoration(
                        //color: Colors.black,
                        shape: CircleBorder(),
                        color: Color(0xff709be4),
                      ),
                      child: Image.asset(
                        'assets/images/compte.png',
                        fit: BoxFit.fill,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                      top: size.height * .03,
                      bottom: size.height * .02,
                    ),
                    width: size.width * .75,
                    height: size.height * .15,
                    child: Column(
                      children: [
                        CustomText(
                          text: controller.userModel.userName,
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        CustomText(
                          text: controller.userModel.email +
                              '  (' +
                              controller.userModel.role +
                              ')',
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
