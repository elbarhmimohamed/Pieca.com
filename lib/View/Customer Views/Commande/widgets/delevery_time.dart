import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/constant.dart';
import 'package:pieca/view_model/commande_view_model.dart';

class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CommandeViewModel>(
        init: CommandeViewModel(),
        builder: (controller) => Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * .07,
                    ),
                    CustomText(
                      text: 'Votre commande sera livrer' +
                          controller.delivrychose,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    RadioListTile<Delivry>(
                      value: Delivry.StandrdDelivry,
                      groupValue: controller.delivry,
                      onChanged: (Delivry value) {
                        controller.changdelivry(value);
                        controller.changdelivrychose(value);
                        controller.changdIsOk(false);
                      },
                      activeColor: Color(0xff709BE4),
                      title: CustomText(
                        text: 'Livraison Standard',
                        fontSize: 20,
                      ),
                      subtitle: CustomText(
                        text: '\nVotre commande sera livrer entre 3 et 5 jours',
                        fontSize: 16,
                        maxLine: 3,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    RadioListTile<Delivry>(
                      value: Delivry.NextDay,
                      groupValue: controller.delivry,
                      onChanged: (Delivry value) {
                        controller.changdelivry(value);
                        controller.changdelivrychose(value);
                        controller.changdIsOk(false);
                      },
                      activeColor: Color(0xff709BE4),
                      title: CustomText(
                        text: 'Livraison 48 h',
                        fontSize: 20,
                      ),
                      subtitle: CustomText(
                        text:
                            '\nVotre commande sera livrer dans 48 h aprés la validation de commande',
                        fontSize: 16,
                        maxLine: 4,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    RadioListTile<Delivry>(
                      value: Delivry.Delivrychoosing,
                      groupValue: controller.delivry,
                      onChanged: (Delivry value) {
                        controller.changdelivry(value);
                        controller.changdelivrychose(value);
                        controller.changdIsOk(true);
                      },
                      activeColor: Color(0xff709BE4),
                      title: CustomText(
                        text: 'Livraison optionnel',
                        fontSize: 20,
                      ),
                      subtitle: CustomText(
                        text: '\nChoisissez la date de livraison',
                        fontSize: 16,
                        maxLine: 4,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    controller.isok
                        ? Container(
                            width: size.width * .8,
                            child: DateTimeFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.event_note),
                                labelText: 'Date de livraison',
                              ),
                              firstDate:
                                  DateTime.now().add(const Duration(days: 6)),
                              initialDate:
                                  DateTime.now().add(const Duration(days: 6)),
                              initialValue: controller.valuedate,
                              mode: DateTimeFieldPickerMode.date,
                              autovalidateMode: AutovalidateMode.always,
                              onDateSelected: (DateTime value) {
                                controller.valuedate = value;
                                controller.changdelivrychose(' le ' +
                                    value.day.toString() +
                                    '/' +
                                    value.month.toString() +
                                    '/' +
                                    value.year.toString());
                              },
                              validator: (DateTime e) {
                                if (e.isNull) {
                                  controller.changgetstatusofbutton(false);
                                  return 'Vous devez choisir un date';
                                }
                              },
                            ),
                          )
                        : CustomText(
                            text: '',
                          ),
                  ],
                ),
              ),
            ));
  }
}
