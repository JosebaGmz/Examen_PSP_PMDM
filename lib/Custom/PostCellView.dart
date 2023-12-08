import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget{

  final String text;
  final int codColor;
  final double fontSize;
  final int posicion;
  final Function (int indice) onPostListClicked;

  const PostCellView({super.key,
    required this.text,
    required this.codColor,
    required this.fontSize,
    required this.posicion,
    required this.onPostListClicked});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
          color: Colors.amber[codColor],
          child: Row(
            children: [
              Image.asset("../assets/img/logo_examen.png",width: 70,
                  height: 70),
              Text(text,style: TextStyle(fontSize: fontSize)),
              TextButton(onPressed: null, child: Text("+",style: TextStyle(fontSize: fontSize)))
            ],
          )

      ),
      onTap: () {
        onPostListClicked(posicion);
        //print("tapped");
        //onItemListClickedFun(iPosicion);
        //print("tapped on container " + iPosicion.toString());
      },
    );
  }

}