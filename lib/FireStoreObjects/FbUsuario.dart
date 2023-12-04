import 'package:cloud_firestore/cloud_firestore.dart';

class FbUsuario{

  final String nombre;
  final int edad;
  final double altura;
  final String sexo;

  FbUsuario({
    required this.nombre,
    required this.edad,
    required this.altura,
    required this.sexo
  });

  factory FbUsuario.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return FbUsuario(
        nombre: data?['nombre'] ? data!['nombre'] : "",
        edad: data?['edad'] != null ? data!['edad'] : 0,
        altura: data?['altura'] != null ? data!['altura'] : 0,
        sexo:data?['sexo'] != null ? data!['sexo'] : ""
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (edad != null) "edad": edad,
      if (altura != null) "altura": altura,
      if (sexo != null) "sexo": sexo,
    };
  }
}