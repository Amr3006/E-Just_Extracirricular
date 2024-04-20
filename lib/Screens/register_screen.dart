// ignore_for_file: unused_local_variable, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, must_be_immutable

import 'package:e_just_extracirricular/Cubits/Auth%20Cubit/auth_cubit.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_broken/icon_broken.dart';

class Register_Screen extends StatelessWidget {
  Register_Screen({super.key});
  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is failedCreatingUserState) {
            snackBar(context: context, text: state.error);
          } else if (state is successCreatingUserState) {
            snackBar(context: context, text: "Registered Successfully");
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          var emailController = cubit.emailController;
          var passwordController = cubit.passwordController;
          var nameController = cubit.nameController;
          var phoneController = cubit.phoneController;
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(items: [
              BottomNavigationBarItem(icon: Icon(Icons.school), label: "Student"),
              BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: "Club")
            ],
            selectedItemColor: mainColor,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            elevation: 0,
            onTap: (value) =>cubit.changeIndex(value),
            currentIndex: cubit.index,
            type: BottomNavigationBarType.shifting,
            ),
            backgroundColor: Colors.black,
            body: Form(
              key: formKey,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    largeVbox,
                    Text(
                      "E-JUST Extracirricular",
                      style: GoogleFonts.oswald()
                          .copyWith(color: Colors.white, fontSize: 30),
                    ),
                    largeVbox,
                    Expanded(
                      child: Container(
                        width: width,
                        decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          largeVbox,
                          Text(
                            "Register",
                            style: GoogleFonts.sourceCodePro()
                                .copyWith(fontSize: 30),
                          ),
                          largeVbox,
                          Padding(
                              padding: mediumPadding,
                              child: ReusableTextField(
                                controller: nameController,
                                inputType: TextInputType.text,
                                prefixIcon: IconBroken.Profile,
                                label: "Name",
                                validator: "Please enter your name"
                              )),
                          Padding(
                              padding: mediumPadding,
                              child: ReusableTextField(
                                controller: phoneController,
                                inputType: TextInputType.phone,
                                prefixIcon: IconBroken.Swap,
                                label: "Phone",
                                validator: "Please enter your phonen number"
                              )),
                          Padding(
                              padding: mediumPadding,
                              child: ReusableTextField(
                                controller: emailController,
                                inputType: TextInputType.emailAddress,
                                prefixIcon: IconBroken.Message,
                                label: "Email Address",
                                validator: "Please check your email"
                              )),
                          Padding(
                              padding: mediumPadding,
                              child: ReusableTextField(
                                controller: passwordController,
                                inputType: TextInputType.visiblePassword,
                                prefixIcon: IconBroken.Password,
                                suffixIcon: Icons.remove_red_eye,
                                obscured: cubit.obscured,
                                function: () => cubit.changeObscurity(),
                                label: "Password",
                                validator: "Please check your email"
                              )),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: mediumPadding,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: const [
                                              mainColor,
                                              Colors.orange
                                            ]),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: MaterialButton(
                                      height: 70,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                        cubit.signUp(context);
                                        }
                                      },
                                      child: Text(
                                        "REGISTER",
                                        style: GoogleFonts.abel().copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                      animationDuration:
                                          Duration(milliseconds: 1000),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                                                  ),
                      ),
                                              ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
