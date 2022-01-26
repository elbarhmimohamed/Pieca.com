import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Customer%20Views/Profil/profil.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/selected_Filed.dart';
import 'package:pieca/helper/text_filed.dart';
import 'package:pieca/view_model/Annonce_View_Model.dart';
import 'package:pieca/view_model/auth_View_Model.dart';
import 'package:select_form_field/select_form_field.dart';

class AnnonceView extends GetWidget<AnnonceViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  static String routename = "/signup";
  //int user = 1;
  String type_user = 'Client';
  @override
  Widget build(BuildContext context) {
    String name, descreption, image, prix, stock, cat;
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AnnonceViewModel>(
        init: AnnonceViewModel(),
        builder: (controller) => controller.loding.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white12,
                  centerTitle: true,
                  title: Text(
                    "Ajouter un produit",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: RaisedButton(
                    color: Colors.white12,
                    onPressed: () => Get.to(HomeView()),
                    elevation: 0.0,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Column(
                      children: [
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              //image
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RaisedButton(
                                      child: CustomText(
                                        text: 'Ajouter image',
                                      ),
                                      color: Colors.lightBlue,
                                      onPressed: () => controller.UploadImage(),
                                    ),
                                    (controller.picname != '')
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Flexible(
                                                child: CustomText(
                                                  text: controller.picname,
                                                  maxLine: 10,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    controller.destroyPicname();
                                                  },
                                                  icon: Icon(
                                                      Icons.close_outlined)),
                                            ],
                                          )
                                        : CustomText(
                                            text: '',
                                          ),
                                  ]),
                              //categories-------------------------------
                              CustomSelectedFiled(
                                items: controller.itemofcat(),
                                onsave: (value) {
                                  controller.cat = value;
                                },
                                onvalide: (value) {
                                  if (value.isEmpty) {
                                    return 'Vous devez choisir la catégorie';
                                  }
                                },
                                //input: TextInputType.name,
                                labeltext: 'Catégorie *',
                              ),

                              //nom-------------------------------
                              CustomTextFiled(
                                onsave: (value) {
                                  controller.name = value;
                                },
                                onvalide: (value) {
                                  if (value.isEmpty) {
                                    return 'Vous devez saisir le nom ';
                                  }
                                },
                                input: TextInputType.name,
                                labeltext: 'Nom de produit *',
                              ),
                              //email-------------------------------
                              CustomTextFiled(
                                input: TextInputType.multiline,
                                onsave: (value) {
                                  controller.descreption = value;
                                },
                                onvalide: (value) {
                                  if (value.isEmpty) {
                                    return 'Vous devez saisir la descreption';
                                  }
                                },
                                labeltext: 'Descreption * ',
                              ),

                              //password-------------------------------

                              CustomTextFiled(
                                txtf: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                input: TextInputType.number,
                                onsave: (value) {
                                  controller.prix = value;
                                },
                                onvalide: (value) {
                                  if (value.isEmpty) {
                                    return 'Vous devez saisir le prix ';
                                  }
                                },
                                labeltext: 'Prix en DH*',
                                hinttext: '100',
                              ),
                              //qtité-------------------------------
                              CustomTextFiled(
                                input: TextInputType.number,
                                txtf: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                onsave: (value) {
                                  controller.stock = value;
                                },
                                onvalide: (value) {
                                  if (value.isEmpty) {
                                    return 'Vous devez saisir la quantité ';
                                  }
                                },
                                labeltext: 'quantité*',
                                hinttext: '10',
                              ),

                              //button

                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: size.height * 0.05),
                                width: size.width * 0.9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FlatButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 50),
                                      color: Colors.blue,
                                      onPressed: () {
                                        _formkey.currentState.save();
                                        if (_formkey.currentState.validate()) {
                                          controller.saveProduct();
                                        }
                                      },
                                      child: Text('Ajouter l\'annonce',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ))),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: size.height * 0.002),
                                width: size.width * 0.9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FlatButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 50),
                                      color: Colors.grey[300],
                                      onPressed: () {
                                        Get.offAll(() => HomeView());
                                      },
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
                )));
  }
}
