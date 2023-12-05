import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../FireStoreObjects/FbPosts.dart';

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db =FirebaseFirestore.instance;
  final List<FbPosts> posts = [];

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