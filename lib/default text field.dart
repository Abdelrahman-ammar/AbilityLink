import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  DefaultTextField({
    required this.controller,
    required this.keyboardtype,
    required this.labletext,
    this.onsubmit = null,
    this.onChange = null,
    this.validate = null,
    this.suffixpressed,
    this.prefixicon,
    this.suffixicon,
    this.fontsize = 18.0,
    this.height = 45,
    this.weight = 250,
    this.ispass = false,
    this.iconColor = const Color.fromARGB(255, 100, 104, 108),
    this.fillcolor = Colors.black12,
    this.radius = 5.0,
    this.maxlenth,
  });
  TextEditingController controller;
  TextInputType? keyboardtype;
  ValueChanged? onsubmit;
  ValueChanged? onChange;
  FormFieldValidator? validate;
  VoidCallback? suffixpressed;
  late String labletext;
  IconData? prefixicon;
  IconData? suffixicon;
  double fontsize;
  double height;
  double weight;
  bool ispass;
  Color iconColor;
  Color fillcolor;
  double radius;
  int? maxlenth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: weight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: fillcolor,
          border: Border.all(
            color: Color.fromARGB(155, 103, 152, 226),
          )),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: labletext,
            hintStyle: TextStyle(
                fontSize: 15,
                color: Color(0xff858585),
                fontWeight: FontWeight.w400),
            prefixIcon: prefixicon != null
                ? Icon(
                    prefixicon,
                    color: iconColor,
                  )
                : null,
            suffixIcon: suffixicon != null
                ? IconButton(
                    onPressed: () {
                      suffixpressed!();
                    },
                    icon: Icon(suffixicon),
                    color: iconColor,
                  )
                : null,
            // border:const OutlineInputBorder(),
            border: InputBorder.none,
            prefix: SizedBox(
              width: 15,
            )),
        keyboardType: keyboardtype,
        obscureText: ispass,
        onFieldSubmitted: onsubmit,
        onChanged: onChange,
        validator: validate,
        style: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        maxLength: maxlenth,
        cursorColor: Colors.black,
      ),
    );
  }
}
