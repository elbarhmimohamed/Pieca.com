import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/view_model/commande_view_model.dart';

class CommanedSucces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CommandeViewModel>(
        builder: (controller) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/undraw_successful_purchase_re_mpig.svg',
                      width: size.width * .5,
                      height: size.height * .25,
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        child: CustomText(
                      alignment: Alignment.center,
                      text: 'Commande succès',
                    )),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        child: CustomText(
                      alignment: Alignment.center,
                      text:
                          'Vous recevrez un message pour confirmer votre demande. Merci',
                      maxLine: 3,
                      fontSize: 14,
                    )),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff1e88e5),
                      ),
                      width: size.width * .5,
                      height: size.height * .06,
                      child: FlatButton(
                        child: CustomText(
                          text: 'Accueil',
                          fontSize: 20,
                          alignment: Alignment.center,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.offAll(() => HomeView());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
