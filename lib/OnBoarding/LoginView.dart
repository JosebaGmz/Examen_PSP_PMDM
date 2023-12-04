import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Custom/CTextF.dart';
import '../Custom/MenuBottom.dart';

class LoginView extends StatelessWidget{

  FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext _context;
  TextEditingController tUsername = TextEditingController();
  TextEditingController tPassword = TextEditingController();

  void onClickRegistrar(){
    Navigator.of(_context).pushNamed("/registerview");
  }

  void onClickAceptar() async {

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: tUsername.text,
          password: tPassword.text
      );

      print("----LOGEADO----");

      String uid=FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> datos=await db.collection("Usuarios").doc(uid).get();
      if(datos.exists){
        Navigator.of(_context).popAndPushNamed("/homeview");
      }
      else{
        Navigator.of(_context).popAndPushNamed("/perfilview");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    Column columna = Column(children: [
      Text("Bienvenido a mi Examen!",style: TextStyle(fontSize: 25)),

      CTextF(hint: "Escribe tu usuario", tController: tUsername,password: false,),
      CTextF(hint: "Escribe tu contraseña",tController: tPassword,password: true,),

      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: onClickAceptar, child: Text("Iniciar Sesion"),),
          TextButton(onPressed: onClickRegistrar, child: Text("Registrate Aqui"),)
        ],)

    ],);

    AppBar appBar = AppBar(
      title: const Text("Iniciar Sesion"),
      centerTitle: true,
      shadowColor: Colors.white,
      backgroundColor: Colors.black,
    );

    Scaffold scaf = Scaffold(body: columna,
      appBar: appBar,
      bottomNavigationBar: MenuBottom(onButtonClicked: onBottonMenuPressed),
    );

    return scaf;
  }

  @override
  void onBottonMenuPressed(int indice) {
    // TODO: implement onBottonMenuPressed
    if(indice==0)exit(0);
    print("---------->>> LOGIN: "+indice.toString());
  }

}
