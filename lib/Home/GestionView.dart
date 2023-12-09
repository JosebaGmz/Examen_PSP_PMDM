import 'package:flutter/material.dart';

class Gestionview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("GESTION")),
      body: Column(
          children: [
            Center(child: Text("ESTAS EN LA PAGINA GESTION/ADMINISTRACION"))
          ]
      ),
    );
  }


}