import 'package:bookmngr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

insertLivro(a, s, d, g, h, j) async{

  db.collection('livros')
    .document(s)
      .setData(
      {
        "codigo":a,
        "titulo":s,
        "genero":d,
        "editora":g,
        "autor":h,
        "ano":j,
      }
      );
}

buscarLivros() async {
  QuerySnapshot busca = 
    await db.collection('livros').getDocuments();
      busca.documents.forEach((livro) {
        return livro;
      });
}