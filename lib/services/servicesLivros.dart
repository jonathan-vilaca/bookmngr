import 'package:bookmngr/services/database.dart';

insertLivro(a, s, d, f, g, h, j) async{

  db.collection('livros')
    .document(a)
      .setData(
      {
        "codigo":a,
        "titulo":s,
        "genero":d,
        "exemplares":f,
        "editora":g,
        "autor":h,
        "ano":j,
      }
      );
}