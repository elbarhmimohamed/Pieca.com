import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Customer%20Views/Details_View/details_views.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/view_model/home_view_model.dart';

class MyhomBbody extends GetWidget<HomeViewModel> {
  static String routename = "/home";

  @override
  Widget build(BuildContext context) {
    Color col1 = Colors.deepOrange.shade200;
    Color col = Colors.cyan.shade200;
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeViewModel>(
        builder: (controller) => controller.loding.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    //color: Color(0xff3A99aa),
                    color: Color(0xff709be4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: size.height * 0.08, left: 0, right: 0),
                          child: Column(
                            children: [
                              _SearchFiled(size),
                              SizedBox(height: size.height * 0.04),
                              //
                              _Pub(size),
                              //
                              SizedBox(height: size.height * 0.03),
                              //
                              CustomText(
                                text: 'Catégories',
                                color: Colors.white,
                              ),

                              SizedBox(height: size.height * 0.03),

                              _ListofCategories(size),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0,
                        ),
                        _ListOfProduct(size, col),
                      ],
                    ),
                  ),
                ),
              ));
  }

  Widget _SearchFiled(size) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        //((((((((((((((((((()))))))))))))))))))

        //((((((((((((((((((((()))))))))))))))))))))
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.white,
                //color: Color(0xff9E9E9E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onChanged: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                        vertical: size.width * 0.04),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Chercher les produits",
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            /*SizedBox(
              width: size.width * 0.03,
            ),
            Container(
                width: size.width * 0.12,
                height: size.height * 0.06,
                decoration: ShapeDecoration(
                  color: Colors.white,
//                  color: Color(0xff000000).withOpacity(0.1),
                  shape: CircleBorder(),
                  //borderRadius: BorderRadius.circular(1000),
                ),
                child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Get.to(() => ProfilView());
//                      Get.offAll(() => ProfilView());
                    })),*/
          ],
        ),
      ),
    );
  }

  Widget _ListofCategories(size) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
              //width: size.width * 0.9,
              padding: EdgeInsets.only(top: 2, left: 10, right: 0),
              height: size.height * 0.12,
              child: ListView.separated(
                itemCount: controller.categoryModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[100],
                        ),
                        height: 46,
                        width: 46,
                        child: Image.network(
                          controller.categoryModel[index].image,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CustomText(
                        fontSize: 13,
                        text: controller.categoryModel[index].name,
                        color: Colors.white,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: size.width * 0.008,
                ),
              ),
            ));
  }

  Widget _ListOfBestproduct(size) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
              color: Colors.white,
              //width: size.width * 0.9,
              height: size.height * .5,
              child: ListView.separated(
                itemCount: controller.productModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        DetailViews(
                          model: controller.productModel[index],
                        ),
                      );
                    },
                    child: Container(
                      width: size.width * .4,
                      child: Column(
                        children: [
                          Container(
                            //padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            height: size.height * .25,
                            child: Image.network(
                              controller.productModel[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CustomText(
                            text: controller.productModel[index].name,
                            alignment: Alignment.bottomLeft,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CustomText(
                            text: 'Stock  : ' +
                                controller.productModel[index].stock.toString(),
                            color: Colors.grey,
                            alignment: Alignment.bottomLeft,
                          ),
                          SizedBox(
                            height: size.height * 0.014,
                          ),
                          CustomText(
                            text:
                                controller.productModel[index].prix.toString() +
                                    'Dhs',
                            color: Colors.teal,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: size.width * 0.05,
                ),
              ),
            ));
  }

  Widget _Pub(size) {
    return Container(
      width: size.width * 1,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 0),
            width: size.width * 0.9,
            height: size.height * 0.15,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          ),
        ],
      ),
    );
  }

  Widget _ListOfProduct(size, col) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                  ),
                  color: Colors.grey[200],
                ),
                //color: Colors.grey[300],
                //width: size.width * 0.9,
                height: size.height * .6,
                padding: EdgeInsets.only(
                    top: size.height * 0.0005,
                    bottom: size.height * 0.02,
                    left: size.width * 0.02,
                    right: size.width * 0.02),
                child: ListView.separated(
                  itemCount: controller.productModel.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => (DetailViews(
                            model: controller.productModel[index],
                          )),
                        );
                      },
                      child: Container(
                        height: size.height * .16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            //BorderRadius.only(topRight: Radius.circular(60)),
                            //border: Border.all(color: Colors.black26),
                            color: Colors.white),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: size.width * .3,
                                height: size.height * .16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                  child: Image.network(
                                    controller.productModel[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.height * .002,
                                  right: size.height * .002,
                                  top: size.height * .015),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.productModel[index].name,
                                    alignment: Alignment.bottomLeft,
                                    fontSize: 20,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.025,
                                      ),
                                      Icon(
                                        Icons.inventory_outlined,
                                      ),
                                      CustomText(
                                        text: 'Stock  : ' +
                                            controller.productModel[index].stock
                                                .toString(),
                                        color: Colors.grey,
                                        alignment: Alignment.bottomLeft,
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.012,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.025,
                                      ),
                                      Icon(
                                        Icons.attach_money_outlined,
                                      ),
                                      CustomText(
                                        text: controller
                                                .productModel[index].prix
                                                .toString() +
                                            'Dhs',
                                        color: Colors.teal,
                                        fontSize: 20,
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
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: size.height * 0.02,
                  ),
                ),
              ),
            ));
  }
}
