import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examenjoseba/Custom/CTextF.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget{

  TextEditingController tNombre=TextEditingController();
  TextEditingController tEdad=TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext _context;

  void onClickAceptar() async{

    final usuario = <String,dynamic>{
      "nombre" : tNombre.text,
      "edad" : int.parse(tEdad.text),
    };

    // Add a new document with a generated ID
    //db.collection("users").add(usuario).then((DocumentReference doc) =>
    //print('DocumentSnapshot added with ID: ${doc.id}'));

    String uidUsuario = FirebaseAuth.instance.currentUser!.uid;
    await db.collection("Usuarios").doc(uidUsuario).set(usuario);

    Navigator.of(_context).popAndPushNamed("/homeview");
  }

  void onClickCancelar(){

  }

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Perfil"),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      body:
      ConstrainedBox(constraints: BoxConstraints(
        minWidth: 500,
        minHeight: 700,
        maxWidth: 2560,
        maxHeight: 1440,
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CTextF(hint: "Nombre", tController: tNombre, password: false),
            CTextF(hint: "Edad", tController: tEdad, password: false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: onClickAceptar, child: Text("Aceptar"),),
                TextButton( onPressed: onClickCancelar, child: Text("Cancelar"),)
              ],
            )
          ],
        ),
      ),
    );
  }


}