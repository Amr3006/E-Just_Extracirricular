// ignore_for_file: file_names, unused_import

import 'package:e_just_extracirricular/Models/User%20Model.dart';
import 'package:flutter/material.dart';

const smallVbox = SizedBox(height: 8);
const mediumVbox = SizedBox(height: 16);
const largeVbox = SizedBox(height: 20);
const smallHbox = SizedBox(width: 8);
const mediumHbox = SizedBox(width: 16);
const largeHbox = SizedBox(width: 20);
const smallPadding = EdgeInsets.all(8);
const mediumPadding = EdgeInsets.all(16);
const largePadding = EdgeInsets.all(20);

late double height;
late double width;

final mediumSeparator = Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child: Container(
            width: width,
            height: 0.5,
            color: Colors.grey.withAlpha(700),
          ),
        );

final largeSeparator = Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Container(
            width: width,
            height: 1,
            color: Colors.grey,
          ),
        );

String? uId;
