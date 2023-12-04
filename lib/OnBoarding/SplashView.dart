import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../FireStoreObjects/FbUsuario.dart';

class SplashView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    checkSession();
  }

  void checkSession() async{

    await Future.delayed(Duration(seconds: 4));
    if(FirebaseAuth.instance.currentUser != null){

      String uid=FirebaseAuth.instance.currentUser!.uid;

      DocumentReference<FbUsuario> ref=db.collection("Usuarios")
          .doc(uid)
          .withConverter(fromFirestore: FbUsuario.fromFirestore,
        toFirestore: (FbUsuario usuario, _) => usuario.toFirestore(),);

      FbUsuario usuario;

      DocumentSnapshot<FbUsuario> docSnap=await ref.get();
      usuario=docSnap.data()!;

      if(usuario!=null){
        print("El nombre del usuario es: "+usuario.nombre);
        print("La edad del usuario es: "+usuario.edad.toString());
        Navigator.of(context).popAndPushNamed("/homeview");
      }
      else{
        Navigator.of(context).popAndPushNamed("/perfilview");
      }

    }
    else{
      Navigator.of(context).popAndPushNamed("/loginview");
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Column column=Column(
      children: [
        Image.asset("../assets/img/logo_examen.png",width: 300,
            height: 450),
        CircularProgressIndicator()
      ],
    );

    return column;
  }
}