import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Custom/DrawerClass.dart';
import '../Custom/MenuBottom.dart';
import '../Custom/PostCellView.dart';
import '../Custom/PostGridCellView.dart';
import '../FireStoreObjects/FbPosts.dart';
import '../OnBoarding/LoginView.dart';
import '../SingleTone/DataHolder.dart';

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db =FirebaseFirestore.instance;
  final List<FbPosts> posts = [];
  bool isList = false;

  void descargarPosts() async{

    CollectionReference<FbPosts> ref=db.collection("Posts")
        .withConverter(fromFirestore: FbPosts.fromFirestore,
      toFirestore: (FbPosts post, _) => post.toFirestore(),);


    QuerySnapshot<FbPosts> querySnapshot=await ref.get();
    for(int i = 0; i< querySnapshot.docs.length;i++) {
      setState(() {
        posts.add(querySnapshot.docs[i].data());
      });
    }
  }

  void onBottonMenuPressed(int indice) {
    // TODO: implement onBottonMenuPressed
    setState(() {
      if(indice == 0){
        isList=true;
      }
      else if(indice==1){
        isList=false;
      }
      else if(indice==2){
        exit(0);
      }
    });

  }

  void fHomeViewDrawerOnTap(int indice){
    print("---->>>> "+indice.toString());
    if(indice==0){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil (
        MaterialPageRoute (builder: (BuildContext context) =>  LoginView()),
        ModalRoute.withName('/loginview'),
      );
    }
    else if(indice==1){
      exit(0);
    }
  }

  void onPostListClicked(int index){
    DataHolder().postSelected=posts[index];
    DataHolder().saveSelectedPostInCac();
    Navigator.of(context).pushNamed("/postview");
  }

  Widget? creadorDeItemLista(BuildContext context, int index){
    return PostCellView(text: posts[index].titulo,
        codColor: 0,
        fontSize: 20,
        posicion: index,
        onPostListClicked: onPostListClicked
    );
  }

  Widget? creadorDeItemMatriz(BuildContext context, int index){
    return PostGridCellView(text: posts[index].titulo,
        fontSize: 28,
        codColor: 0,
        dHeight: 200,
        posicion: index,
        onPostListClicked: onPostListClicked
    );
  }

  Widget creadorDeSeparadorLista(BuildContext context, int index){
    return Column(
      children: [
        Divider(),
      ],
    );
  }

  Widget celdasOLista(bool isList) {
    if (isList) {
      return ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: posts.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder: creadorDeSeparadorLista,
      );
    } else {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: posts.length,
          itemBuilder: creadorDeItemMatriz
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descargarPosts();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("MyApp"),
        actions: [
          IconButton(
            icon: Icon(Icons.admin_panel_settings),
            onPressed: () {
              Navigator.of(context).pushNamed("/gestionview");
            },
          ),
        ],),
      body: Center(
        child: celdasOLista(isList),
      ),
      bottomNavigationBar: MenuBottom(onButtonClicked: this.onBottonMenuPressed),
      drawer: DrawerClass(onItemTap: fHomeViewDrawerOnTap,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed("/postcreateview");
        },
        child: Icon(Icons.post_add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }


}