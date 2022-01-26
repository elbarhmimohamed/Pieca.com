import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pieca/View/Customer%20Views/Profil/iconButtonNavigat.dart';
import 'package:pieca/View/home/components/custom_text.dart';
import 'package:pieca/View/home/homeView.dart';
import 'package:pieca/helper/text_filed.dart';
import 'package:pieca/view_model/profil_view_model.dart';

class EditProfilView extends GetWidget<ProfilViewModel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ProfilViewModel>(
        init: ProfilViewModel(),
        builder: (controller) => Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: CustomText(
                  text: 'Compte',
                  fontSize: 20,
                ),
                elevation: 0.0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.offAll(() => HomeView());
                  },
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ignore: avoid_types_as_parameter_names
                    CustomTextFiled(
                      labeltext: 'Nom',
                      hinttext: 'Nom',
                      icon: IconButton(onPressed: () {}, icon: Icon(null)),
                      input: TextInputType.text,
                      onsave: (String value) {},
                      onvalide: (String value) {},
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    CustomTextFiled(
                      labeltext: 'Email',
                      hinttext: 'Email',
                      icon: IconButton(onPressed: () {}, icon: Icon(null)),
                      input: TextInputType.text,
                      onsave: (String value) {},
                      onvalide: (String value) {},
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    CustomTextFiled(
                      labeltext: 'Password',
                      hinttext: '********',
                      icon: IconButton(onPressed: () {}, icon: Icon(null)),
                      input: TextInputType.text,
                      onsave: (String value) {},
                      onvalide: (String value) {},
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    /*CustomTextFiled(
              labeltext: 'Confirmation',
              hinttext: '********',
              icon: const Icon(null),
              input: TextInputType.text,
              onsave: (String? value) {},
              onvalide: (String? value) {},
            ),*/
                    SizedBox(
                      height: size.height * .01,
                    ),
                    TextFormField(
                      initialValue: '******',
                      obscureText: controller.obscureText,
                      decoration: InputDecoration(
                        helperText: 'password',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.changeIcon();
                          },
                          icon: controller.icon,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                        labelText: 'password',
                        hintText: 'password',
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFF757575)),
                            gapPadding: 10),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFF757575)),
                            gapPadding: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFF757575)),
                            gapPadding: 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFF757575)),
                            gapPadding: 10),
                      ),
                    ),

                    SizedBox(
                      height: size.height * .02,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.05),
                      width: size.width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 50),
                            color: Color(0xff709BE4),
                            onPressed: () {
                              //   _formkey.currentState!.save();
                              // if (_formkey.currentState!.validate()) {
                              // controller.SignUpWithEmainAndPassword();}
                            },
                            child: CustomText(
                              text: 'Modifier',
                              alignment: Alignment.center,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 50),
                            color: Colors.grey,
                            onPressed: () {
                              Get.offAll(() => HomeView());
                            },
                            child: CustomText(
                              text: 'Annuler',
                              alignment: Alignment.center,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
