// ignore_for_file: prefer_const_constructors

import 'package:e_just_extracirricular/Design/Themes.dart';
import 'package:e_just_extracirricular/Screens/home_screen.dart';
import 'package:e_just_extracirricular/Screens/login_screen.dart';
import 'package:e_just_extracirricular/Shared/CacheHelper.dart';
import 'package:e_just_extracirricular/Shared/Constants.dart';
import 'package:e_just_extracirricular/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC0TXpAC0wpOGkej2UZYQN0wojvX7KaQZg',
      appId: '1:466737081524:android:562b72d2e40948b954fbe1',
      messagingSenderId: '10',
      projectId: 'e-just-extracirricular',
      storageBucket: 'e-just-extracirricular.appspot.com',
      )
    );
  runApp(const MyApp());
}

Widget startingScreen() {
  uId = cacheHelper.getData(key: "uId");
  if (uId != null) {
    return Home_Screen();
  }
  return Login_Screen();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    uId=cacheHelper.getData(key: 'uId');
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return MaterialApp(
      home: startingScreen(),
      debugShowCheckedModeBanner: false,
      theme: whiteTheme,
    );
  }
}