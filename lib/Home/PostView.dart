
import 'package:examenjoseba/SingleTone/FirebaseAdmin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FireStoreObjects/FbPosts.dart';
import '../Singletone/DataHolder.dart';

class PostView extends StatefulWidget{
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  FbPosts _datosPost = FbPosts(descripcion: "NAN",imgUrl: "NAN",titulo: "NAN");
  bool blPostLoaded=false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    cargarPostGuardadoEnCache();
  }

  void cargarPostGuardadoEnCache() async{
    var temp1=await FirebaseAdmin().loadFbpost();
    setState(() {

      _datosPost=temp1!;
      blPostLoaded=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(DataHolder().sNombre)),
      body: blPostLoaded ? Column(
        children: [
          Text(_datosPost.titulo),
          Text(_datosPost.descripcion),
          Image.network(_datosPost.imgUrl),
          TextButton(onPressed: null, child: Text("Me gusta"))
        ],
      )
          :
      CircularProgressIndicator(),
    );
  }
}