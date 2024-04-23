// ignore_for_file: non_constant_identifier_names, unnecessary_import, unused_import, prefer_const_constructors

import 'dart:io';

import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_broken/icon_broken.dart';

Widget ReusableTextField({
  String? hint,
  String? label,
  String? validator,
  void Function()? function,
  bool obscured = false,
  IconData? prefixIcon,
  IconData? suffixIcon,
  required TextInputType inputType,
  required TextEditingController controller
  }) => TextFormField(
    keyboardType: inputType,
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return validator;
      }
      return null;
    },
    cursorColor: mainColor,
    cursorErrorColor: mainColor,
    obscureText: obscured,
    style: const TextStyle(fontSize: 20,color: Color.fromARGB(217, 0, 0, 0)),
    decoration:  InputDecoration(
      labelText: label,
      prefixIconConstraints: const BoxConstraints(minWidth: 60),
      suffixIcon: IconButton(onPressed: function,
      icon: Icon(suffixIcon)),
      prefixIcon: Icon(prefixIcon,color: mainColor,),
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 20),
      labelStyle: const TextStyle(fontSize: 20),
      floatingLabelStyle: const TextStyle(color: Colors.black,fontSize: 18),
      focusColor: mainColor,
      hoverColor: mainColor,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: mainColor,width: 2)
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: mainColor,width: 2)
      )
    ),
  );

  Widget PostTextField({
  String? hint,
  void Function()? function,
  required TextInputType inputType,
  required TextEditingController controller,
  String? validator,
  }) => TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return validator;
      }
      return null;
    },
    keyboardType: inputType,
    controller: controller,
    cursorColor: mainColor,
    cursorErrorColor: mainColor,
    maxLines: 10,
    minLines: 1,
    style: const TextStyle(fontSize: 20,color: Colors.white),
    decoration:  InputDecoration(
      hintText: hint,
      prefixIconConstraints: const BoxConstraints(minWidth: 60),
      hintStyle: TextStyle(fontSize: 20 , color: Colors.white.withAlpha(100)),
      floatingLabelStyle: const TextStyle(color: Colors.black,fontSize: 18),
      focusColor: mainColor,
      hoverColor: mainColor,
      border: InputBorder.none,
    ),
  );


void navigateTo({
required BuildContext context,
required Widget destination,
}) {
Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
}

void navigateToAndErase({
required BuildContext context,
required Widget destination,
}) {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => destination));
}

void snackBar({
required BuildContext context,
required String text
}) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
content: Row(
                children: [
                  Expanded(
                      child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  )),
                  TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                      },
                      child: const Text("Dismiss",
                          style: TextStyle(color: Colors.orangeAccent)))
                ],
              )
));

Widget mainProgressIndicator() {
  if (Platform.isIOS) {
    return const Center(child: CupertinoActivityIndicator(radius: 16,),);
  }

  return const Center(child: CircularProgressIndicator(color: mainColor,),);
}
