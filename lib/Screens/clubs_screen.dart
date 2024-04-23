// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, unused_import


import 'dart:ffi';

import 'package:e_just_extracirricular/Cubits/App%20Cubit/app_cubit.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Models/User%20Model.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Clubs_Screen extends StatelessWidget {
  const Clubs_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var clubs = cubit.clubs;
        return ListView.separated(
            itemBuilder: (context, index) => Listbuilder(clubs[index], cubit),
            separatorBuilder: (context, index) => mediumSeparator,
            itemCount: clubs.length);
      },
    );
  }

  Widget Listbuilder(UserModel model, AppCubit cubit) {
    var isFollowed = cubit.user!.following.contains(model.uId);
    return Padding(
      padding: mediumPadding,
      child: Row(
        children: [
          Text(model.name,style: TextStyle(color: Colors.white,fontSize: 24),),
          Expanded(child: SizedBox()),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 12,
            color: !isFollowed ? Colors.orangeAccent[100] : Colors.deepOrange,
            child: MaterialButton(
              elevation: 0,
              color: !isFollowed ? Colors.orangeAccent[100] : Colors.deepOrange,
              splashColor: Colors.transparent,
              animationDuration: Duration(seconds: 0),
              onPressed: () {
                cubit.followClub(model.uId);
              },
              child: Container(
                width: 80,
                alignment: Alignment.center,
                child: Text(
                  isFollowed ? "Followed" : "Follow",
                  style: TextStyle(
                    color: isFollowed ? Colors.white : Colors.black,
                    fontSize: 16),),
              ),
              ),
          )
        ],
      ),
    );
  }
}
