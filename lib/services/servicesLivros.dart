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

buscarLivros() async {
  QuerySnapshot busca = 
    await db.collection("acervo").getDocuments();
    return busca.documents;
}

void deletarLivro(context, liv, position){
  db.collection('acervo').document(liv.documentID).delete(); 
}


listarLivros(){
  db.collection('acervo').snapshots().listen((livros) {
    livros.documents.forEach((liv) {
      return liv.data;
    });
  });
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