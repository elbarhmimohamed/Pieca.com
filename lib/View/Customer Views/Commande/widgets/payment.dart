import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/view_model/commande_view_model.dart';

class Payement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CommandeViewModel>(
        builder: (controller) => Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: CustomText(
                    text: 'Payement page',
                  )),
                ],
              ),
            ));
  }
}
