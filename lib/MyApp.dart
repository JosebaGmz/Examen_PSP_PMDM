import 'package:examenjoseba/Home/GestionView.dart';
import 'package:examenjoseba/Home/HomeView.dart';
import 'package:examenjoseba/Home/PostCreateView.dart';
import 'package:examenjoseba/Home/PostView.dart';
import 'package:examenjoseba/OnBoarding/PerfilView.dart';
import 'package:examenjoseba/OnBoarding/SplashView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Home/PostCreateWeb.dart';
import 'OnBoarding/LoginView.dart';
import 'OnBoarding/RegisterView.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;

    if(kIsWeb) {
      materialApp = MaterialApp(title: "My App",
        routes: {
          '/loginview': (context) => LoginView(),
          '/registerview': (context) => RegisterView(),
          '/splashview': (context) => SplashView(),
          '/homeview': (context) => HomeView(),
          '/perfilview': (context) => PerfilView(),
          '/postview': (context) => PostView(),
          '/postcreateview': (context) => PostCreateWeb(),
          '/gestionview': (context) => Gestionview()
        },
        initialRoute: '/splashview',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'PlayfairDisplay'),
      );
    }else{
      materialApp = MaterialApp(title: "My App",
        routes: {
          '/loginview': (context) => LoginView(),
          '/registerview': (context) => RegisterView(),
          '/splashview': (context) => SplashView(),
          '/homeview': (context) => HomeView(),
          '/perfilview': (context) => PerfilView(),
          '/postview': (context) => PostView(),
          '/postcreateview': (context) => PostCreateView(),
          '/gestionview': (context) => Gestionview()
        },
        initialRoute: '/loginview',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'PlayfairDisplay'),
      );
    }
    return materialApp;
  }
}