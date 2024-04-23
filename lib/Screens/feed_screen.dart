// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, avoid_unnecessary_containers, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace

import 'package:e_just_extracirricular/Cubits/App%20Cubit/app_cubit.dart';
import 'package:e_just_extracirricular/Design/Colors.dart';
import 'package:e_just_extracirricular/Models/Post%20Model.dart';
import 'package:e_just_extracirricular/Screens/post_screen.dart';
import 'package:e_just_extracirricular/Shared/Components.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:flutter/cupertino.dart';
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
        var posts = cubit.posts;
        var user = cubit.user;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (user!.isClub)
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
              if (posts.isEmpty)
                Container(
                  padding: largePadding,
                  child: Text(
                    "There is no posts to catch up with or you didn't follow any clubs",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                    )),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => PostListBuilder(posts[index]), 
                separatorBuilder: (context, index) => largeSeparator, 
                itemCount: posts.length)
            ],
          ),
        );
      },
    );
  }

  Widget PostListBuilder(PostModel model) {
    var date = DateTime.parse(model.postDate);
    DateTime? eventDate;
    if (model.eventDate!=null) {
      eventDate = DateTime.parse(model.eventDate!);
    }
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: width-(width/4) ,child: Text(model.posterName,style: TextStyle(color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                          Text("${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute}",style: TextStyle(color: Colors.grey,fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                  mediumSeparator,
                  Text(model.postText,style: TextStyle(color: Colors.white),),
                  if (eventDate!=null)
                    smallVbox,
                  if (eventDate!=null)
                    Text("Event Date : ${eventDate.day}/${eventDate.month}/${eventDate.year} - ${eventDate.hour}:${eventDate.minute}",style: TextStyle(color: mainColor,fontSize: 16),),
                  smallVbox,
                  if (model.postImage!=null) 
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Image(
                        image:NetworkImage(model.postImage!),
                      ),
                    )
                ],
              ),
            );
  }
}
