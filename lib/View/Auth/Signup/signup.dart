import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Auth/login.dart';
import 'package:pieca/View/Auth/Signup/signup_view_model.dart';
import 'package:pieca/helper/text_filed.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/view_model/auth_View_Model.dart';

class Signup_View extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  static String routename = "/signup";
  //int user = 1;
  String type_user = 'Client';
  @override
  Widget build(BuildContext context) {
    String email, password, name, role, passwordConfirmation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white12,
          centerTitle: true,
          title: Text(
            "Créer un nouveau compte",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: RaisedButton(
            color: Colors.white12,
            onPressed: () => Get.to(Login_View()),
            elevation: 0.0,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      //nom-------------------------------
                      CustomTextFiled(
                        onsave: (value) {
                          controller.name = value;
                        },
                        onvalide: (value) {
                          if (value!.isEmpty) {
                            return 'Vous devez saisir le nom ';
                          }
                        },
                        input: TextInputType.name,
                        icon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.person_outline)),
                        labeltext: 'Nom complet *',
                        hinttext: 'entrez votre nom complet',
                      ),
                      //email-------------------------------
                      CustomTextFiled(
                        onsave: (value) {
                          controller.email = value;
                        },
                        onvalide: (value) {
                          if (value!.isEmpty) {
                            return 'Vous devez saisir l\'Email';
                          }
                        },
                        input: TextInputType.emailAddress,
                        icon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.mail_outline)),
                        labeltext: 'Email * ',
                        hinttext: 'entrez votre email',
                      ),

                      //password-------------------------------
                      CustomTextFiled(
                        obscuretext: true,
                        onsave: (value) {
                          controller.password = value;
                        },
                        onvalide: (value) {
                          if (value!.isEmpty) {
                            return 'Vous devez saisir le mot de passe';
                          }
                          if (value.isNotEmpty) {
                            if (value.length < 6) {
                              return 'Vous devez saisir au moins 6 caracréres ';
                            }
                          }
                        },
                        input: TextInputType.text,
                        icon: IconButton(
                            onPressed: () {
                              controller.changeIcon();
                            },
                            icon: controller.icon),
                        labeltext: 'Mot de passe *',
                        hinttext: '******',
                      ),

                      //confirmation of password-------------------------------
                      CustomTextFiled(
                        obscuretext: true,
                        onsave: (value) {
                          controller.password_confirmation = value;
                        },
                        onvalide: (value) {
                          if (value!.isEmpty) {
                            return 'Vous devez confirmer votre mot de passe';
                          }
                          if (controller.password != null) {
                            if (controller.password != value) {
                              return 'Vous devez saisir méme mot de passe';
                            }
                          }
                        },
                        input: TextInputType.text,
                        icon: IconButton(
                            onPressed: () {
                              controller.changeIcon();
                            },
                            icon: controller.icon),
                        labeltext: 'confirmez votre mot de passe *',
                        hinttext: '******',
                      ),

                      //button

                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.05),
                        width: size.width * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 50),
                              color: Colors.blue,
                              onPressed: () {
                                _formkey.currentState!.save();
                                if (_formkey.currentState!.validate()) {
                                  controller.SignUpWithEmainAndPassword();
                                }
                              },
                              child: Text('Inscription',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ))),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.002),
                        width: size.width * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 50),
                              color: Colors.grey[300],
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => HomeView())),
                              child: Text('Annuler',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
