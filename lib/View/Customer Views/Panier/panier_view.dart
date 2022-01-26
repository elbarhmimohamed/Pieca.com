import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Customer%20Views/Commande/commande_view.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/view_model/home_view_model.dart';
import 'package:pieca/view_model/panier_view_model.dart';
import 'package:pieca/view_model/profil_view_model.dart';

class PanierView extends GetWidget<HomeViewModel> {
  static String routename = "/panier";

  ProfilViewModel profilViewModel = Get.find<ProfilViewModel>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return controller.loding.value
        ? Center(child: CircularProgressIndicator())
        : GetBuilder<PanierViewModel>(
            init: PanierViewModel(),
            builder: (controller) => controller.listofproduct.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/cart1.svg',
                          width: size.width * .7,
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Container(
                          child: CustomText(
                            text: 'Panier vide',
                            fontSize: 24,
                            alignment: Alignment.center,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                      ],
                    ),
                  )
                : Scaffold(
                    body: Center(
                    child: Container(
                      color: Colors.black12,
                      child: Column(
                        children: [
                          Expanded(child: _ListOfProduct(size)),
                          Container(
                            padding: EdgeInsets.all(size.width * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(size.width * .01),
                                  decoration: BoxDecoration(
                                      //color: Colors.indigo[300],
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: ' Total ',
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      CustomText(
                                        text: controller.total.toString() +
                                            ' Dhs',
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  //borderRadius: BorderRadius.circular(30),
                                  child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding:
                                          EdgeInsets.all(size.width * 0.04),
                                      onPressed: () {
                                        Get.offAll(() => CommandeView());
                                      },
                                      color: Color(0xff709BE4),
                                      child: CustomText(
                                        text: 'Commander',
                                        fontSize: 19,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
  }

  Widget _ListOfProduct(size) {
    return controller.loding.value
        ? Center(child: CircularProgressIndicator())
        : GetBuilder<PanierViewModel>(
            init: PanierViewModel(),
            builder: (controller) => Container(
                  padding: EdgeInsets.only(
                      left: size.width * .02,
                      top: size.width * .03,
                      right: size.width * .02),
                  height: size.height * .5,
                  child: ListView.separated(
                    itemCount: controller.listofproduct.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        /* onTap: () {
                      Get.to(
                        DetailViews(
                          model: controller.productModel[index],
                        ),
                      );
                    },*/
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                  width: size.width * .3,
                                  height: size.height * .18,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0)),
                                    child: Image.network(
                                      controller.listofproduct[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: controller
                                            .listofproduct[index].name,
                                        fontSize: 20,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      CustomText(
                                        text: controller
                                                .listofproduct[index].prix
                                                .toString() +
                                            'Dhs',
                                        color: Colors.teal,
                                        fontSize: 20,
                                      ),
                                      CustomText(
                                        text: 'Max : ' +
                                            controller
                                                .listofproduct[index].stock
                                                .toString(),
                                        fontSize: 18,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Container(
                                        width: size.width * .3,
                                        height: size.height * .04,
                                        color: Colors.grey[300],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.decreaseQte(index);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                              ),
                                            ),
                                            CustomText(
                                              text: controller
                                                  .listofproduct[index].qte
                                                  .toString(),
                                              alignment: Alignment.center,
                                              fontSize: 20,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.increaseQte(
                                                    index,
                                                    controller
                                                        .listofproduct[index]
                                                        .stock);
                                              },
                                              child: Icon(
                                                Icons.add,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.amber,
                                width: size.width * .2,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: size.width * 0.16,
                                        bottom: size.height * 0.09,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.deletProductfromPanier(
                                              controller.listofproduct[index]);
                                        },
                                        child: Icon(
                                          Icons.close_outlined,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: size.height * 0.02,
                    ),
                  ),
                ));
  }
}
