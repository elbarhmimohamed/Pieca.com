// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Customer%20Views/Commande/widgets/payment.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/constant.dart';
import 'package:pieca/view_model/commande_view_model.dart';
import 'package:status_change/status_change.dart';

import 'widgets/add_address.dart';
import 'widgets/delevery_time.dart';
import 'widgets/summary.dart';

class CommandeView extends GetWidget<CommandeViewModel> {
  const CommandeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CommandeViewModel>(
        init: CommandeViewModel(),
        builder: (controller) => Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: CustomText(
                    text: 'Commande',
                    color: Colors.black,
                  )),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    height: 100,
                    child: StatusChange.tileBuilder(
                      theme: StatusChangeThemeData(
                        direction: Axis.horizontal,
                        connectorTheme: const ConnectorThemeData(
                            space: 1.0, thickness: 1.0),
                      ),
                      builder: StatusChangeTileBuilder.connected(
                        itemWidth: (_) =>
                            MediaQuery.of(context).size.width /
                            _processes.length,
                        nameWidgetBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              _processes[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: controller.getColor(index),
                              ),
                            ),
                          );
                        },
                        indicatorWidgetBuilder: (_, index) {
                          if (index == controller.index) {
                            return DotIndicator(
                              size: 35.0,
                              border: Border.all(
                                  color: const Color(0xff709BE4), width: 1),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: controller.icon,

                                /*Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff709BE4),
                                  ),
                                ),*/
                              ),
                            );
                          } else {
                            if (index <= controller.index) {
                              return DotIndicator(
                                size: 35.0,
                                border: Border.all(
                                    color: Color(0xff709BE4), width: 1),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.check,
                                      color: Color(0xff709BE4)),
                                ),
                              );
                            }

                            return const OutlinedDotIndicator(
                              size: 30,
                              borderWidth: 1.0,
                              color: todoColor,
                            );
                          }
                        },
                        lineWidgetBuilder: (index) {
                          if (index > 0) {
                            if (index == controller.index) {
                              final prevColor = controller.getColor(index - 1);
                              final color = controller.getColor(index);
                              var gradientColors;
                              gradientColors = [
                                prevColor,
                                Color.lerp(prevColor, color, 0.5)
                              ];
                              return DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                ),
                              );
                            } else {
                              return SolidLineConnector(
                                color: controller.getColor(index),
                              );
                            }
                          } else {
                            return null;
                          }
                        },
                        itemCount: _processes.length,
                      ),
                    ),
                  ),
                  controller.pages == Pages.DeliveryTime
                      ? DeliveryTime()
                      : controller.pages == Pages.AddAddress
                          ? AddAddress()
                          : controller.pages == Pages.payement
                              ? Payement()
                              : Summary(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      width: size.width * .8,
                      height: size.height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ClipRRect(
                              //borderRadius: BorderRadius.circular(30),
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.all(size.width * 0.04),
                                  onPressed: () {
                                    controller.index != 0
                                        ? controller.changeindexdec(
                                            controller.index - 1)
                                        : Get.offAll(HomeView());
                                  },
                                  color: Color(0xffcfcfcf),
                                  child: controller.index != 0
                                      ? CustomText(
                                          text: 'Retour',
                                          fontSize: 19,
                                          color: Colors.black,
                                        )
                                      : CustomText(
                                          text: 'Annuler',
                                          fontSize: 19,
                                          color: Colors.black,
                                        )),
                            ),
                          ),
                          controller.getstatusofbutton == true
                              ? ClipRRect(
                                  //borderRadius: BorderRadius.circular(30),
                                  child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding:
                                          EdgeInsets.all(size.width * 0.04),
                                      onPressed: () {
                                        controller.index < 3
                                            ? controller.changeindex(
                                                controller.index + 1)
                                            : Get.offAll(() => HomeView());
                                        // controller.index == 1
                                        //? controller.setadressdata()
                                        //   : print('null');
                                      },
                                      color: Color(0xff709BE4),
                                      child: controller.index < 3
                                          ? CustomText(
                                              text: 'Suivant',
                                              fontSize: 19,
                                              color: Colors.white,
                                            )
                                          : CustomText(
                                              text: 'Commander',
                                              fontSize: 18,
                                              color: Colors.white,
                                            )),
                                )
                              : CustomText(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}

final _processes = [
  'Livraison',
  'Addresse',
  'Paiement',
  'Commande',
];
