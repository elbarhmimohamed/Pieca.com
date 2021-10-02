import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Auth/Signup/signup.dart';
import 'package:pieca/helper/text_filed.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/view_model/auth_View_Model.dart';

class Login_View extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  static String routename = "/login";

  @override
  Widget build(BuildContext context) {
    String email, password;
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthViewModel>(
        init: AuthViewModel(),
        builder: (controller) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: CustomText(
                text: 'Connexion',
                color: Colors.black,
                fontSize: 24,
                alignment: Alignment.center,
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Get.offAll(() => HomeView());
                },
              ),
              elevation: 0.0,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  children: [
                    Container(
                      width: size.width * .3,
                      child: Image.asset(
                        'assets/images/pieca.png',
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),

                    //////////
                    Form(
                      //key: _formkey,
                      key: controller.globalKeylogin,
                      child: Column(
                        children: [
                          //email-------------------------------
                          CustomTextFiled(
                            onvalide: (value) {
                              if (value!.isEmpty) {
                                return 'Vous devez saisir l\'Email';
                              }
                            },
                            onsave: (value) {
                              controller.email = value!;
                            },
                            input: TextInputType.emailAddress,
                            labeltext: 'Email',
                            hinttext: 'entrer votre email',
                            icon: Icon(Icons.mail_outlined),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          //password-------------------------------
                          CustomTextFiled(
                            obscuretext: true,
                            onvalide: (value) {
                              if (value!.isEmpty) {
                                return 'Vous devez saisir l\'Email';
                              }
                            },
                            onsave: (value) {
                              controller.password = value;
                            },
                            input: TextInputType.text,
                            labeltext: 'Mot de passe',
                            hinttext: 'entrer votre mot de passe',
                            icon: Icon(Icons.lock_outline),
                            helper: '',
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          //forget-----------------
                          Text(
                            'Mot de passe oublié?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //-->login

                          RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: "vous n\'avez pas encors de compte?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                  text: "  S\'inscrire",
                                  style: TextStyle(
                                    color: Color(0xff1e88e5),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(Signup_View())),
                            ],
                          )),

                          //button

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            width: size.width * 0.9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 50),
                                  color: Color(0xff709BE4),
                                  onPressed: () {
                                    // _formkey.currentState?.save();
                                    // if (_formkey.currentState.validate()) {
                                    controller.LoginWithEmainAndPassword();
                                    //}
                                  },
                                  child: Text('Se connecter',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ))),
                            ),
                          ),
                          SizedBox(),
                          Text(
                            '-OU-',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    ///////////
                    //gmail-------------------
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 5),
                      width: size.width * 0.9,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 40),

                            hoverColor: Colors.black,
                            //color: Color(0xff00897B),
                            onPressed: () {
                              controller.googleSignInMethod();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/google.png"),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Se connecter avec Google',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    )),
                              ],
                            ),
                          )),
                    ),
                    //facebook-------------------
                    /* Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: size.width * 0.8,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 40),
                            //color: Color(0xff00897B),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/facebook.png"),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Se connecter avec Facebook',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    )),
                              ],
                            ),
                          )),
                    ),*/
/*
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      width: size.width * 0.9,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 40),

                            hoverColor: Colors.black,
                            //color: Color(0xff00897B),
                            onPressed: () {
                              Get.offAll(() => HomeView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.transfer_within_a_station_outlined,
                                ),
                                Text('Continue comme anonyme',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          )),
                    ),*/
/*
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      width: size.width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 50),
                            color: Color(0xff8d9aff),
                            onPressed: () {
                              Get.offAll(() => HomeView());
                            },
                            child: Text('Connecter plus tard',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ))),
                      ),
                    ),*/
                  ],
                ),
              ),
            )));
  }
}
