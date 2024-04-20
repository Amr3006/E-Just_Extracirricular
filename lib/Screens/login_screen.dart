// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors, sort_child_properties_last, unused_local_variable, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_just_extracirricular/Cubits/Auth%20Cubit/auth_cubit.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Screens/register_screen.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_broken/icon_broken.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});
  var formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is successLogInState) {
            snackBar(context: context, text: "Logged in Successfully");
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          var emailController=cubit.emailController;
          var passwordController=cubit.passwordController;
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: ConditionalBuilder(
                condition: state is! loadingLogInState,
                fallback: (context) => mainProgressIndicator(),
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    largeVbox,
                    Text(
                      "E-JUST Extracirricular",
                      style: GoogleFonts.oswald()
                          .copyWith(color: Colors.white, fontSize: 30),
                    ),
                    largeVbox,
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
                              "Login",
                              style: GoogleFonts.sourceCodePro()
                                  .copyWith(fontSize: 30),
                            ),
                            largeVbox,
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
                                  function: ()=>cubit.changeObscurity(),
                                  label: "Password",
                                  validator: "Please check your password"
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
                                        onPressed: (){
                                          cubit.signIn(context);
                                        },
                                        child: Text(
                                          "LOGIN",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "DON'T HAVE AN ACCOUNT?",
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(context: context, destination: Register_Screen());
                                  },
                                  child: Text(
                                    "CREATE ONE",
                                    style: TextStyle(
                                        fontSize: 14, color: mainColor),
                                  ),
                                  style: ButtonStyle(
                                      splashFactory: NoSplash.splashFactory),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
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
