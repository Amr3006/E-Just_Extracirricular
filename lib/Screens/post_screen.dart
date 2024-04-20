// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:e_just_extracirricular/Cubits/App%20Cubit/app_cubit.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_broken/icon_broken.dart';

class Post_Screen extends StatelessWidget {
  Post_Screen({super.key});

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              titleSpacing: 0,
              leading: IconButton(
                icon: Icon(
                  IconBroken.Arrow___Left_Square,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "E-JUST Extracirricular",
                style: GoogleFonts.oswald()
                    .copyWith(color: Colors.white, fontSize: 30),
              ),
              backgroundColor: backgroundColor,
              actions: [
                if (state is! uploadingPostImageState && state is! uploadingPostState)
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.uploadPost(context);
                      }
                    },
                    child: Text(
                      "POST",
                      style: TextStyle(color: mainColor),
                    ))
              ],
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state is uploadingPostImageState || state is uploadingPostState)
                      LinearProgressIndicator(color: mainColor,backgroundColor: Colors.orangeAccent[100],),
                    Padding(
                      padding: mediumPadding,
                      child: PostTextField(
                          inputType: TextInputType.text,
                          controller: cubit.textController,
                          validator: "Please enter text to share",
                          hint: "What would you like to share"),
                    ),
                    if (cubit.postFileImage != null)
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Padding(
                          padding: mediumPadding,
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              height: height/3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                image: FileImage(cubit.postFileImage!)
                                )
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            cubit.removeImage();
                          },
                          shape: CircleBorder(eccentricity: 0.1),
                          child: Icon(Icons.close,color: Colors.deepOrange[900],),
                          color: Colors.orange[200],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.pickImage();
              },
              child: Icon(Icons.add_a_photo_outlined,
                  color: Colors.deepOrange[900]),
              backgroundColor: Colors.orange[200],
            ),
          );
        },
      ),
    );
  }
}
