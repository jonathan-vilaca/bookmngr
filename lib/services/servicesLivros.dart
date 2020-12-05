import 'package:bookmngr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

insertLivro(a, s, d, g, h, j, k) async{
  String livro = a;
  db.collection("acervo")
    .document(livro)
      .setData(
      {
        "codigo":a,
        "titulo":s,
        "genero":d,
        "editora":g,
        "autor":h,
        "ano":j,
        "disponivel":k
      });
}

Stream<QuerySnapshot> buscarLivros() {
  return db.collection('acervo')
    .snapshots();
}

deletarLivro(context, liv, position) async {
  db.collection('acervo').document(liv.documentID).delete(); 
}


Future updateLivro(a, s, d, g, h, j, k) async{
  String livro = a;
  db.collection("acervo")
    .document(livro)
      .updateData(
      {
        "codigo":a,
        "titulo":s,
        "genero":d,
        "editora":g,
        "autor":h,
        "ano":j,
        "disponivel":k
      });
}
