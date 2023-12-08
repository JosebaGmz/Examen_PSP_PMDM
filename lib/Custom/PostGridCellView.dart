import 'package:flutter/material.dart';

class PostGridCellView extends StatelessWidget{

  final String text;
  final int codColor;
  final double fontSize;
  final double dHeight;
  final int posicion;
  final Function (int indice) onPostListClicked;

  const PostGridCellView({super.key,
    required this.text,
    required this.codColor,
    required this.fontSize,
    required this.dHeight,
    required this.posicion,
    required this.onPostListClicked
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      InkWell(
        child: FractionallySizedBox(
          child: Container(
              height: dHeight,
              width: dHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.3,
                      image: NetworkImage("https://media.tenor.com/foxAfr7BfMEAAAAC/aprobado-examen.gif"),
                      fit: BoxFit.cover
                  )
              ),
              color: Colors.amber[codColor],
              child: Column(
                children: [
                  //Image.asset("resources/logo_kyty.png",width: 70, height: 70),
                  //Text(sText,style: TextStyle(fontSize: dFontSize)),
                  Expanded(
                      child: Text(text,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                      )),
                  TextButton(onPressed: null, child: Text("+",style: TextStyle(fontSize: fontSize)))
                ],
              )
          ),
        ),
        onTap: () {
          onPostListClicked(posicion);
        },
      );

  }
}