// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_just_extracirricular/Models/User%20Model.dart';
import 'package:e_just_extracirricular/Screens/home_screen.dart';
import 'package:e_just_extracirricular/Screens/login_screen.dart';
import 'package:e_just_extracirricular/Shared/CacheHelper.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var obscured=true;
  void changeObscurity() {
    obscured=!obscured;
    emit(changeObscurityState());
  }

  var index=0;
  void changeIndex(int i) {
    index=i;
    emit(changeIndexState());
  }

  void signIn(BuildContext context) {
    emit(loadingLogInState());
    auth
    .signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text)
      .then((value) {
        emit(successLogInState());
        uId=value.user!.uid;
        cacheHelper.saveData(key: "uId", value: uId);
        navigateToAndErase(context: context, destination: Home_Screen());
      });
  }

  void signUp(BuildContext context) {
    emit(loadingCreatingUserState());
    auth
    .createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
      ).then((value) {
        createUser(value.user!.uid, context);
      }).catchError((error) {
        print(error.toString());
        emit(failedCreatingUserState(error.toString()));
      });
  }

  Map<int,bool> student_club = {
    0:false,
    1:true,
  };

  void createUser(
    String temp_uId,
    BuildContext context
  ) {
    UserModel model = UserModel(
      name: nameController.text,
      following: [],
      email: emailController.text, 
      phone: phoneController.text, 
      uId: temp_uId,
      isClub: index==0 ? false : true, 
      profilePicture: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png");
      firestore
      .collection("Users")
      .doc(temp_uId)
      .set(model.toJson())
      .then((value) {
        emit(successCreatingUserState());
        uId=temp_uId;
        cacheHelper.saveData(key: "uId", value: uId);
        navigateToAndErase(context: context, destination: Home_Screen());
      }).catchError((error) {
        emit(failedCreatingUserState(error.toString()));
        print(error.toString());
      });
  }

  void signOut(BuildContext context) {
    auth
    .signOut()
    .then((value) {
      emit(signOutState());
      uId=null;
      cacheHelper.deleteData(key: 'uId');
      navigateToAndErase(context: context, destination: Login_Screen());
    });
  }

}
