import 'dart:io';

import 'package:examenjoseba/Custom/CButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Custom/CTextF.dart';
import '../FireStoreObjects/FbPosts.dart';
import '../SingleTone/DataHolder.dart';

class PostCreateView extends StatefulWidget{

  @override
  State<PostCreateView> createState() => _PostCreateViewState();
}

class _PostCreateViewState extends State<PostCreateView> {
  TextEditingController tcTitulo=TextEditingController();

  TextEditingController tcCuerpo=TextEditingController();

  ImagePicker _picker=ImagePicker();

  File _imagePreview= File("");

  void onGalleryClicked() async{
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
        _imagePreview=File(image.path);
      });
    }
  }

  void onCameraClicked() async{
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      setState(() {
        _imagePreview=File(image.path);
      });
    }
  }

  void subirPost() async {

    final storageRef = FirebaseStorage.instance.ref();

    String rutaEnNube=
        "posts/"+FirebaseAuth.instance.currentUser!.uid+"/imgs/"+
            DateTime.now().millisecondsSinceEpoch.toString()+".jpg";

    final rutaAFicheroEnNube = storageRef.child(rutaEnNube);

    final metadata = SettableMetadata(contentType: "image/jpeg");
    try {
      await rutaAFicheroEnNube.putFile(_imagePreview,metadata);

    } on FirebaseException catch (e) {

    }
    String imgUrl=await rutaAFicheroEnNube.getDownloadURL();


    FbPosts postNuevo=new FbPosts(
        titulo: tcTitulo.text,
        descripcion: tcCuerpo.text,
        imgUrl: imgUrl);
    DataHolder().insertPostEnFb(postNuevo);

    Navigator.of(context).popAndPushNamed("/homeview");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("prueba")),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: CTextF(hint: "Titulo del Post",tController:tcTitulo,password: false),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: CTextF(hint: "Descripcion",tController: tcCuerpo,password: false),
          ),
          Image.file(_imagePreview,width: 200,height: 200,),
          Row(
            children: [
              CButton( text: "Galeria",onPressed: onGalleryClicked ),
              CButton(text: "Camara",onPressed: onCameraClicked),
            ],
          ),
          CButton(text: "Subir",onPressed: subirPost)
        ],
      ),
    );
  }
}