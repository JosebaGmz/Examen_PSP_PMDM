import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Custom/CTextF.dart';
import '../FireStoreObjects/FbPosts.dart';
import '../SingleTone/DataHolder.dart';

class PostCreateView extends StatelessWidget{

  TextEditingController tcTitulo=TextEditingController();
  TextEditingController tcCuerpo=TextEditingController();

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
          Image.network("src"),
          TextButton(onPressed: (){
            FbPosts newPost= new FbPosts(
                titulo: tcTitulo.text,
                descripcion: tcCuerpo.text,
                imgUrl: "");
            DataHolder().insertPostEnFb(newPost);

            Navigator.of(context).popAndPushNamed("/homeview");
          }, child: Text("Subir"))
        ],
      ),
    );
  }


}