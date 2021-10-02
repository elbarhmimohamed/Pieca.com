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
                          if (Value == null) {
                            print('ERROR');
                          }
                        },
                        input: TextInputType.name,
                        icon: Icon(Icons.person_outline),
                        labeltext: 'Nom complet *',
                        hinttext: 'entrez votre nom complet',
                        helper: '',
                        initval: '',
                      ),
                      //email-------------------------------
                      CustomTextFiled(
                        onsave: (value) {
                          controller.email = value;
                        },
                        onvalide: (value) {
                          if (Value == null) {
                            print('ERROR');
                          }
                        },
                        input: TextInputType.emailAddress,
                        icon: Icon(Icons.mail_outline),
                        labeltext: 'Email * ',
                        hinttext: 'entrez votre email',
                        initval: '',
                        helper: '',
                      ),

                      //password-------------------------------
                      CustomTextFiled(
                        obscuretext: true,
                        onsave: (value) {
                          controller.password = value;
                        },
                        onvalide: (value) {
                          if (Value == null) {
                            print('ERROR');
                          }
                        },
                        input: TextInputType.text,
                        icon: Icon(Icons.lock_outline),
                        labeltext: 'Mot de passe *',
                        hinttext: 'entrez votre mot de passe',
                        helper: '',
                        initval: '',
                      ),

                      //confirmation of password-------------------------------
                      CustomTextFiled(
                        obscuretext: true,
                        onsave: (value) {
                          controller.password_confirmation = value;
                        },
                        onvalide: (value) {
                          if (Value == null) {
                            print('ERROR');
                          }
                        },
                        input: TextInputType.text,
                        icon: Icon(Icons.lock_outline),
                        labeltext: 'confirmez votre mot de passe *',
                        hinttext: 'confirmez votre mot de passe',
                        helper: '',
                        initval: '',
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

  Widget Radiocheck() {
    return GetBuilder<SignupViewModel>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: controller.roleValue,
                onChanged: (value) {
                  controller.ChangeSelectedValue(1);
                },
                activeColor: Colors.blue,
              ),
              Text(
                'Client',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: controller.roleValue,
                onChanged: (value) {
                  controller.ChangeSelectedValue(2);
                  // controller.role = 'Fournisseurs' ,
                },
                activeColor: Colors.blue,
              ),
              Text(
                'Fournisseurs',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
