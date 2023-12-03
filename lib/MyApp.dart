import 'package:flutter/material.dart';

import 'OnBoarding/LoginView.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;

    materialApp = MaterialApp(title: "My App",
      routes: {
        '/loginview': (context) => LoginView(),
      },
      initialRoute: '/loginview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlayfairDisplay'),
    );

    return materialApp;
  }
}