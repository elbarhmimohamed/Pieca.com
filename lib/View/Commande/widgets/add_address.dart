import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/helper/text_filed.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/view_model/commande_view_model.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CommandeViewModel>(
        init: CommandeViewModel(),
        builder: (controller) => Form(
              key: controller.globalKey,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * .05,
                        ),
                        CustomTextFiled(
                          hinttext: 'Nom du contact',
                          labeltext: 'Nom du contact',
                          initval: controller.userModel!.userName,
                          onsave: (value) {
                            controller.name = value;
                          },
                          onvalide: (value) {
                            if (value!.isEmpty) {
                              return 'Vous devez saisir un nom de contact';
                            }
                          },
                          helper: '',
                          icon: IconButton(onPressed: () {}, icon: Icon(null)),
                          input: TextInputType.name,
                        ),
                        CustomTextFiled(
                          hinttext: 'Num de téléphone',
                          labeltext: 'Num de téléphone',
                          input: TextInputType.phone,
                          initval: controller.tele,
                          onsave: (value) {
                            controller.tele = value;
                          },
                          onvalide: (value) {
                            if (value!.isEmpty) {
                              return 'Vous devez saisir un numéro de téléphone portable';
                            }
                          },
                          helper: '',
                          icon: IconButton(onPressed: () {}, icon: Icon(null)),
                        ),
                        CustomTextFiled(
                          hinttext: 'Adresse de livraison',
                          labeltext: 'Adresse de livraison',
                          initval: controller.adress,
                          onsave: (value) {
                            controller.adress = value;
                          },
                          onvalide: (value) {
                            if (value!.isEmpty) {
                              return 'Vous devez saisir une adresse valide';
                            }
                          },
                          helper: '',
                          icon: IconButton(onPressed: () {}, icon: Icon(null)),
                          input: TextInputType.name,
                        ),
                        Container(
                          width: size.width * .9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomTextFiled(
                                  hinttext: 'Ville',
                                  labeltext: 'Ville',
                                  initval: controller.city,
                                  onsave: (value) {
                                    controller.city = value;
                                  },
                                  onvalide: (value) {
                                    if (value!.isEmpty) {
                                      return 'Vous devez saisir une ville valide';
                                    }
                                  },
                                  helper: '',
                                  icon: IconButton(
                                      onPressed: () {}, icon: Icon(null)),
                                  input: TextInputType.name,
                                ),
                              ),
                              SizedBox(
                                width: size.width * .05,
                              ),
                              Expanded(
                                child: CustomTextFiled(
                                  hinttext: 'Code postal',
                                  labeltext: 'Code postal',
                                  initval: controller.code,
                                  onsave: (value) {
                                    controller.code = value;
                                  },
                                  onvalide: (value) {
                                    if (value!.isEmpty) {
                                      return 'Vous devez saisir un code postal valide';
                                    }
                                  },
                                  helper: '',
                                  icon: IconButton(
                                      onPressed: () {}, icon: Icon(null)),
                                  input: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Définir tant qu\'adresse par défaut',
                              maxLine: 2,
                            ),
                            Switch(
                              activeColor: Color(0xff709BE4),
                              value: controller.switchval,
                              onChanged: (value) {
                                controller.switchval
                                    ? controller.changSwitchVal(false)
                                    : controller.changSwitchVal(true);
                                print(controller.switchval);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
