import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../FireStoreObjects/FbPosts.dart';
import 'DataHolder.dart';

class FirebaseAdmin {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  DataHolder dh = DataHolder();

  Future<FbPosts?> loadFbpost() async{

    if(dh.postSelected != null) return dh.postSelected;

    await Future.delayed(Duration(seconds: 10));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fbpost_titulo = prefs.getString('fbpost_titulo');
    //Esto es lo mismo que hacer el if de abajo pero resumido
    fbpost_titulo ??= "";

    String? fbposts_descripcion = prefs.getString('fbposts_descripcion');
    if(fbposts_descripcion == null){
      fbposts_descripcion = "";
    }

    String? fbposts_imgUrl = prefs.getString('fbposts_imgUrl');
    if(fbposts_imgUrl == null){
      fbposts_imgUrl = "";
    }
    print("------> Prueba " +fbpost_titulo);
    dh.postSelected = FbPosts(titulo: fbpost_titulo, descripcion: fbposts_descripcion, imgUrl: fbposts_imgUrl);
    return dh.postSelected;
  }


}