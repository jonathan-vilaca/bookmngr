import 'package:bookmngr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

insertLivro(a, s, d, g, h, j) async{
  db.collection("acervo")
    .document(s)
      .setData(
      {
        "codigo":a,
        "titulo":s,
        "genero":d,
        "editora":g,
        "autor":h,
        "ano":j,
      });
}

Stream<QuerySnapshot> buscarLivros() {
  return db.collection('acervo')
    .snapshots();
}

deletarLivro(context, liv, position) async {
  db.collection('acervo').document(liv.documentID).delete(); 
}


updateLivro(a, s, d, g, h, j) async{
  db.collection("acervo")
    .document(s)
      .updateData(
      {
        "codigo":a,
        "titulo":s,
        "genero":d,
        "editora":g,
        "autor":h,
        "ano":j,
      });
}
