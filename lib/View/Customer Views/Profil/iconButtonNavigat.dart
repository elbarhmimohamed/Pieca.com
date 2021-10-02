import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pieca/View/home/components/custom_text.dart';

class IconButtonNavigat extends StatelessWidget {
  final String text;

  final Icon icon;

  final Function() onpress;

  IconButtonNavigat(
      {this.text = '', required this.icon, required this.onpress});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          color: Colors.black12,
          child: ListTile(
            title: CustomText(
              text: text,
              fontSize: 18,
              alignment: Alignment.centerLeft,
            ),
            leading: icon,
          ),
          onPressed: onpress,
        ),
      ),
    );
  }
}
