// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, avoid_unnecessary_containers, unused_local_variable, non_constant_identifier_names

import 'package:e_just_extracirricular/Cubits/App%20Cubit/app_cubit.dart';
import 'package:e_just_extracirricular/Models/Post%20Model.dart';
import 'package:e_just_extracirricular/Screens/post_screen.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Feed_Screen extends StatelessWidget {
  const Feed_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (user.isClub)
                Padding(
                padding: smallPadding,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.grey.withAlpha(100),
                  child: InkWell(
                    onTap: () {
                      navigateTo(context: context, destination: Post_Screen());
                    },
                    child: Container(
                      width: width,
                      height: height / 4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1454117096348-e4abbeba002c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JheSUyMGFic3RyYWN0fGVufDB8fDB8fHww"),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding: mediumPadding,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "SHARE YOUR THOUGHTS NOW",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lugrasimo().copyWith(fontSize: 32),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              PostListBuilder(cubit.posts[1]),
              PostListBuilder(cubit.posts[2]),
              PostListBuilder(cubit.posts[3]),
              PostListBuilder(cubit.posts[3]),
              PostListBuilder(cubit.posts[4]),
              PostListBuilder(cubit.posts[4]),
              PostListBuilder(cubit.posts[4]),
              PostListBuilder(cubit.posts[4]),
              PostListBuilder(cubit.posts[4]),
              PostListBuilder(cubit.posts[4]),
            ],
          ),
        );
      },
    );
  }

  Widget PostListBuilder(PostModel model) {
    return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(model.posterProfilePicture),
                      ),
                      mediumHbox,
                      Expanded(child: Text(model.posterName,style: TextStyle(color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,))
                    ],
                  ),
                  mediumSeparator,
                  Text(model.postText,style: TextStyle(color: Colors.white),),
                  smallVbox,
                  if (model.postImage!=null) 
                    Image(
                      image:NetworkImage(model.postImage!),
                    )
                ],
              ),
            );
  }
}
