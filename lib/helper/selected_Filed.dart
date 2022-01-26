import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pieca/view_model/auth_View_Model.dart';
import 'package:select_form_field/select_form_field.dart';

class CustomSelectedFiled extends StatelessWidget {
  final Function(String) onsave;

  final String Function(String) onvalide;

  final String labeltext;
  final String hinttext;
  final IconButton icon;
  final TextInputType input;
  final bool obscuretext;
  final String helper;
  final String initval;
  final List<TextInputFormatter> txtf;
  final List<Map<String, dynamic>> items;
  CustomSelectedFiled(
      {this.onsave,
      this.onvalide,
      this.hinttext,
      this.labeltext,
      this.icon,
      this.input,
      this.obscuretext = false,
      this.helper,
      this.initval,
      this.txtf,
      this.items});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthViewModel>(
        builder: (controller) => Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                SelectFormField(
                  type: SelectFormFieldType.dropdown,
                  items: items,
                  inputFormatters: txtf,
                  initialValue: initval,
                  onSaved: onsave,
                  validator: onvalide,
                  keyboardType: input,
                  obscureText: obscuretext,
                  decoration: InputDecoration(
                    helperText: helper,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: icon,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                    labelText: labeltext,
                    hintText: hinttext,
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
              ],
            ));
  }
}
