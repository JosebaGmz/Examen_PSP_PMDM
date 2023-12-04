import 'package:examenjoseba/Home/HomeView.dart';
import 'package:examenjoseba/OnBoarding/PerfilView.dart';
import 'package:examenjoseba/OnBoarding/SplashView.dart';
import 'package:flutter/material.dart';

import 'OnBoarding/LoginView.dart';
import 'OnBoarding/RegisterView.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;

    materialApp = MaterialApp(title: "My App",
      routes: {
        '/loginview': (context) => LoginView(),
        '/registerview':(context) => RegisterView(),
        '/splashview':(context) => SplashView(),
        '/homeview':(context) => HomeView(),
        '/perfilview':(context) => PerfilView(),
      },
      initialRoute: '/splashview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlayfairDisplay'),
    );

    return materialApp;
  }
}