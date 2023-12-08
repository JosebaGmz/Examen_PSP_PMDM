import 'package:flutter/material.dart';

class DrawerClass extends StatelessWidget{

  Function(int indice)? onItemTap;

  DrawerClass({Key? key,required this.onItemTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(

              color: Colors.black,
            ),
            child: Text(
                style: TextStyle(color: Colors.white),
                'Mi Perfil'
            ),
          ),
          ListTile(
            leading: Image.asset('../assets/img/logo_examen.png'),
            selectedColor: Colors.blue,
            selected: true,
            title: const Text('Cerrar Sesion Web'),
            onTap: () {
              onItemTap!(0);

            },
          ),
          ListTile(
            leading: Icon(Icons.accessible_forward_rounded, color: Colors.red),
            title: const Text('Cerrar Sesion App'),
            onTap: () {
              onItemTap!(1);
            },
          ),
        ],
      ),
    );
  }

}