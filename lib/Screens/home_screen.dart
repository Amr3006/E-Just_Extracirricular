// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, unused_local_variable


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_just_extracirricular/Cubits/App%20Cubit/app_cubit.dart';
import 'package:e_just_extracirricular/Cubits/Auth%20Cubit/auth_cubit.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Screens/feed_screen.dart';
import 'package:e_just_extracirricular/Shared/CacheHelper.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_broken/icon_broken.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getUser()
            ..getPosts()
            ..getClubs(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          int index = cubit.index;
          List<bool> successStates = [
            state is loadingGetUserState,
            state is loadingGettingClubsState,
            state is loadingGettingPostState,
          ];
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
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          AuthCubit.get(context).signOut(context);
                        },
                        icon: Icon(
                          IconBroken.Calendar,
                          color: Colors.white,
                        ));
                  },
                )
              ],
            ),
            drawer: Drawer(
              backgroundColor: backgroundColor.withOpacity(1),
              child: Builder(
                  builder: (context) => ListView(
                        children: [
                          DrawerHeader(
                              child: Icon(
                            IconBroken.Activity,
                            color: Colors.white,
                            size: 60,
                          )),
                          ListTile(
                            leading: Icon(
                              Icons.feed,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Feed",
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              cubit.changeDrawer(0);
                              Scaffold.of(context).closeDrawer();
                            },
                            selected: index == 0 ? true : false,
                            selectedTileColor: Colors.grey.withAlpha(50),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.local_activity,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Clubs",
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              cubit.changeDrawer(1);
                              Scaffold.of(context).closeDrawer();
                            },
                            selected: index == 1 ? true : false,
                            selectedTileColor: Colors.grey.withAlpha(50),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person_2,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Profile",
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              cubit.changeDrawer(2);
                              Scaffold.of(context).closeDrawer();
                            },
                            selected: index == 2 ? true : false,
                            selectedTileColor: Colors.grey.withAlpha(50),
                          ),
                        ],
                      )),
            ),
            body: ConditionalBuilder(
                condition: successStates.contains(true),
                builder: (context) => mainProgressIndicator(),
                fallback: (context) {
                  return cubit.screens[index];
                }),
          );
        },
      ),
    );
  }
}
