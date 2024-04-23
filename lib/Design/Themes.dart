// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';

ThemeData whiteTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleSpacing: 10,
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light
    )
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24,
      fontFamily: "main",
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontFamily: "main",
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: "main",
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
    titleSmall: TextStyle(
      fontSize: 26,
      fontFamily: "main",
      color: Colors.white,
      fontWeight: FontWeight.bold
    )
  ),
  primaryColor: mainColor,
);