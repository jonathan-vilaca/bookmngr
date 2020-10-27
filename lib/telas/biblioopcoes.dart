import 'package:bookmngr/telas/buscalivros.dart';
import 'package:bookmngr/telas/insertlivros.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class biblioopcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.png'),
            fit: BoxFit.cover,
            ),
        ),
        child: 
        Column(
          children: <Widget>[
            SizedBox(//SEPARAR BOTÕES DE LOGIN
                  height: size.height*.22,
                  width: size.width,
                  child:
                    Container(alignment: Alignment.bottomLeft,
                      child: Text("Olá Bibliotecário(a), o que deseja fazer?", 
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16),
                      textAlign: TextAlign.left),
                    ), 
                ),
            Row(//2 botões
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[            
                Card(
                 semanticContainer: true,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: Column(
                   children: <Widget>[
                     GestureDetector(
                       child: Image.asset(
                        'images/cadastrar.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
                         color: Colors.indigo[900],
                         ),
                         onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => insertlivros()));
                         },
                     )
                   ],
                 ),
                ),
               Card(
                 semanticContainer: true,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: Column(
                   children: <Widget>[
                     GestureDetector(
                       child: Image.asset(
                        'images/comprasicon.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
                         color: Colors.indigo[900],
                         ),
                         onTap: () {
                           
                         },
                     )
                   ],
                 ),
                ),
              ],
            ),
            SizedBox(
              height: size.height*.01,
            ),
             Row(//2 botões
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               Card(
                 semanticContainer: true,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: Column(
                   children: <Widget>[
                     GestureDetector(
                       child: Image.asset(
                        'images/emprestar.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
                         color: Colors.indigo[900],
                         ),
                         onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => buscalivros()));
                         },
                     )
                   ],
                 ),
                ),
                Card(
                 semanticContainer: true,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: Column(
                   children: <Widget>[
                     GestureDetector(
                       child: Image.asset(
                        'images/doar.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
                         color: Colors.indigo[900],
                         ),
                         onTap: () {
                           
                         },
                     )
                   ],
                 ),
                ),
              ],
            ),
            SizedBox(
              height: size.height*.01,
            ),
             Row(//2 botões
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               Card(
                 semanticContainer: true,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: Column(
                   children: <Widget>[
                     GestureDetector(
                       child: Image.asset(
                        'images/3.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
                         //color: Colors.indigo[900],
                         ),
                         onTap: () {
 
                         },
                     )
                   ],
                 ),
                ),
                Card(
                 semanticContainer: true,
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 child: Column(
                   children: <Widget>[
                     GestureDetector(
                       child: Image.asset(
                        'images/3.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
                         //color: Colors.indigo[900],
                         ),
                         onTap: () {
                           
                         },
                     )
                   ],
                 ),
                ),
              ],
            ),
          ],
        ),
        padding: const EdgeInsets.all(25),
      ),
    );
  }
}