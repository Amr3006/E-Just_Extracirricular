// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, unused_local_variable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_just_extracirricular/Cubits/App%20Cubit/app_cubit.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Screens/feed_screen.dart';
import 'package:e_just_extracirricular/Shared/CacheHelper.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_broken/icon_broken.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
      ..getUser()
      ..getPosts(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          int index = cubit.index;
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              titleSpacing: 0,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                "E-JUST Extracirricular",
                style: GoogleFonts.oswald()
                    .copyWith(color: Colors.white, fontSize: 30),
              ),
              backgroundColor: backgroundColor,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconBroken.Calendar,
                      color: Colors.white,
                    ))
              ],
            ),
            drawer: Drawer(
              backgroundColor: backgroundColor.withOpacity(1),
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Icon(
                    IconBroken.Activity,
                    color: Colors.white,
                    size: 60,
                  )),
                  ListTile(
                    leading: Icon(Icons.feed,color: Colors.white,),
                    title: Text(
                      "Feed",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      cubit.changeDrawer(0);
                    },
                    selected: index==0 ? true : false,
                    selectedTileColor: Colors.grey.withAlpha(50),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_activity,color: Colors.white,),
                    title: Text(
                      "Clubs",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      cubit.changeDrawer(1);
                    },
                    selected: index==1 ? true : false,
                    selectedTileColor: Colors.grey.withAlpha(50),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_2,color: Colors.white,),
                    title: Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      cubit.changeDrawer(2);
                    },
                    selected: index==2 ? true : false,
                    selectedTileColor: Colors.grey.withAlpha(50),
                  ),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is loadingGetUserState || state is loadingGettingPostState,
              builder: (context) => mainProgressIndicator(),
              fallback: (context) => Feed_Screen()
              ),
          );
        },
      ),
    );
  }
}
