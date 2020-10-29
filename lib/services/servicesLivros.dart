import 'package:bookmngr/services/database.dart';

insertLivro(a, s, d, f, g, h, j) async{

  db.collection('bookmngr')
    .document('livros')
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