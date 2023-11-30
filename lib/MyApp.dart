import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;

    materialApp = MaterialApp(title: "My App",
      routes: {

      },
      initialRoute: '/homeview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlayfairDisplay'),
    );

    return materialApp;
  }
}