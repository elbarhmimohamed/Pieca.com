import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pieca/Model/panier_product_model.dart';
import 'package:pieca/Model/product_model.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/main.dart';
import 'package:pieca/view_model/panier_view_model.dart';

class DetailViews extends StatelessWidget {
  ProductModel model;
  DetailViews({required this.model});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(size),
    );
  }

  Widget _body(size) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                //width: size.width,
                height: size.height * 0.34,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, left: size.width * 0.01, right: 0),
              child: Column(
                children: [
                  CustomText(
                    text: model.name,
                    fontSize: 28,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomText(
                    text: 'Stock total : ' + model.stock.toString(),
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CustomText(
                    text: 'Détails',
                    fontSize: 28,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomText(
                    text: model.descreption,
                    fontSize: 16,
                    maxLine: 100,
                    height: 2,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: ' Prix ',
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      CustomText(
                        text: model.prix.toString() + '  Dhs',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  ClipRRect(
                    //borderRadius: BorderRadius.circular(30),
                    child: GetBuilder<PanierViewModel>(
                      init: PanierViewModel(),
                      builder: (controller) => Container(
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.all(size.width * 0.04),
                            color: Colors.blue,
                            child: CustomText(
                              text: 'Ajouter au panier',
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controller.AddProduct(PanierProductModel(
                                  idProduct: model.idProduct,
                                  name: model.name,
                                  image: model.image,
                                  prix: model.prix,
                                  stock: model.stock,
                                  qte: 1));
                            }),
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
  }
}
