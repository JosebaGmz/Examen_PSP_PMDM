import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AppBar appBar = AppBar(
      title: const Text('Home'),
      centerTitle: true,
      shadowColor: Colors.white,
      backgroundColor: Colors.black,
    );

    Scaffold scaf=Scaffold(appBar: appBar,);

    return scaf;
  }


}