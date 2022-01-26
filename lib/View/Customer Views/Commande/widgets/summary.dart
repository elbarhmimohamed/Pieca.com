import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/Model/panier_product_model.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/view_model/commande_view_model.dart';
import 'package:pieca/view_model/panier_view_model.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CommandeViewModel>(
        builder: (controller) => Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .05),
                    CustomText(
                      text: 'Commande : ',
                      fontSize: 22,
                    ),
                    SizedBox(height: size.height * .02),
                    _productselected(size),
                    SizedBox(height: size.height * .01),
                    Container(
                      width: size.width * .95,
                      height: size.height * .12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * .2,
                            child: Icon(
                              Icons.place_rounded,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff709BE4),
                            ),
                          ),
                          Container(
                            width: size.width * .74,
                            child: Column(
                              children: [
                                CustomText(
                                  text: controller.name.toString() +
                                      ', ' +
                                      controller.tele.toString(),
                                  fontSize: 18,
                                  maxLine: 2,
                                ),
                                CustomText(
                                  text: controller.adress.toString() +
                                      ', ' +
                                      controller.city.toString() +
                                      ', ' +
                                      controller.code.toString(),
                                  fontSize: 16,
                                  maxLine: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    _startAlign(),
                    // SizedBox(height: size.height * .01),
                    Container(
                      width: size.width * .95,
                      height: size.height * .06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * .2,
                            child: Icon(
                              Icons.watch_later_rounded,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff709BE4),
                            ),
                          ),
                          Container(
                            width: size.width * .74,
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'Cemmande sra livrer ' +
                                      controller.delivrychose,
                                  fontSize: 18,
                                  maxLine: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    _startAlign(),
                    // SizedBox(height: size.height * .01),
                    _priceWidget(size),
                  ],
                ),
              ),
            ));
  }

  Widget _productselected(size) {
    return GetBuilder<PanierViewModel>(
        builder: (controller) => Container(
              //color: Colors.black12,
              width: size.width * .95,
              height: size.height * .3,
              padding: EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: controller.listofproduct.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.0, color: Colors.black)),
                  width: size.width * .33,
                  height: size.height * .16,
                  child: Column(
                    children: [
                      Container(
                          width: size.width * .33,
                          height: size.height * .14,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            child: Image.network(
                              controller.listofproduct[index].image,
                              fit: BoxFit.cover,
                            ),
                          )),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      CustomText(
                        text: controller.listofproduct[index].name,
                        fontSize: 14,
                        maxLine: 1,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      CustomText(
                        text: 'Prix : ' +
                            controller.listofproduct[index].prix.toString() +
                            ' dh',
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      CustomText(
                        text: 'Qté : ' +
                            controller.listofproduct[index].qte.toString(),
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      CustomText(
                        text: 'Total : ' +
                            (controller.listofproduct[index].prix *
                                    controller.listofproduct[index].qte)
                                .toString() +
                            ' dh',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: size.width * 0.02,
                ),
              ),
            ));
  }

  Widget _startAlign() {
    return Align(
      alignment: Alignment.center,
      child: CustomText(
        text: '**********',
        alignment: Alignment.center,
        color: Color(0xff709BE4),
        fontSize: 30,
      ),
    );
  }

  Widget _priceWidget(size) {
    return GetBuilder<PanierViewModel>(
      builder: (controller) => Container(
        width: size.width * .95,
        height: size.height * .08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width * .2,
              child: Icon(
                Icons.paid_rounded,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff709BE4),
              ),
            ),
            Container(
              width: size.width * .74,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: ' Prix HT ',
                        fontSize: 16,
                        maxLine: 2,
                      ),
                      CustomText(
                        text: controller.total.toString() + '  dh',
                        fontSize: 16,
                        maxLine: 2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: ' Livraison ',
                        fontSize: 16,
                        maxLine: 2,
                      ),
                      CustomText(
                        text: '300.0 dh',
                        fontSize: 16,
                        maxLine: 2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: ' Prix TTC ',
                        fontSize: 16,
                        maxLine: 2,
                      ),
                      CustomText(
                        text: (controller.total + 300).toString() + 'dhs',
                        fontSize: 16,
                        maxLine: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
