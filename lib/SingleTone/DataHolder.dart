import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../FireStoreObjects/FbPosts.dart';
import 'FirebaseAdmin.dart';

class DataHolder{

  static final DataHolder _dataHolder = DataHolder._internal();

  String sNombre= "Examen DataHolder";
  FirebaseFirestore db = FirebaseFirestore.instance;
  late String postTitulo;
  FbPosts? postSelected;

  DataHolder._internal() {
    postTitulo = "Examen Joseba";
  }

  factory DataHolder(){
    return _dataHolder;
  }

  void insertPostEnFb(FbPosts newPost){
    CollectionReference<FbPosts> postsRef = db.collection("Posts")
        .withConverter(
      fromFirestore: FbPosts.fromFirestore,
      toFirestore: (FbPosts post, _)=> post.toFirestore(),
    );
    postsRef.add(newPost);
  }

  void saveSelectedPostInCac()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('fbposts_titulo', postSelected!.titulo);
    prefs.setString('fbposts_descripcion', postSelected!.descripcion);
    prefs.setString('fbposts_imgUrl', postSelected!.imgUrl);
  }

}