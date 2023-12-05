import 'package:cloud_firestore/cloud_firestore.dart';

class FbPosts{

  final String titulo;
  final String descripcion;
  final String imgUrl;

  FbPosts({
    required this.titulo,
    required this.descripcion,
    required this.imgUrl
  });

  factory FbPosts.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return FbPosts(
        titulo: data?['titulo'],
        descripcion: data?['descripcion'],
        imgUrl: data?['imgUrl'] != null ? data!['imgUrl'] : ""
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (titulo != null) "titulo": titulo,
      if (descripcion != null) "cuerpo": descripcion,
      if (imgUrl != null) "imgUrl": imgUrl
    };
  }
}