import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget{

  Function(int indice)? onButtonClicked;
  Function(String nombre)? onPressed=null;

  MenuBottom({Key? key,required this.onButtonClicked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () => onButtonClicked!(0), child: Icon(Icons.list,color: Colors.black,)),
          TextButton(onPressed: () => onButtonClicked!(1), child: Icon(Icons.grid_view,color: Colors.black,)),
          IconButton(onPressed: () => onButtonClicked!(2), icon: Image.asset("../assets/img/logo_examen.png"))
        ]
    );
  }


}