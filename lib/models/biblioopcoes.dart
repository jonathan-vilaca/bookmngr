import 'package:bookmngr/services/linkAmazon.dart';
import 'package:bookmngr/models/buscalivros.dart';
import 'package:bookmngr/models/insertlivros.dart';
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
            image: AssetImage('images/desfoque.png'),
            fit: BoxFit.cover,
            ),
        ),
        child: 
        Column(
          children: <Widget>[
            Container(
              height: size.height*.20,
              width: size.width,
              color: Colors.indigo,
                child: Image.asset(
                  'images/topo.png', 
                    fit: BoxFit.cover,
                )         
              ),
            SizedBox(//SEPARAR BOTÕES DE LOGIN
                  height: size.height*.05,
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
                elevation: 500,
                color: Colors.transparent,
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
                         color: Colors.white70,
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
                 elevation: 500,
                 color: Colors.transparent,
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
                         color: Colors.white70,
                         ),
                         onTap: () {
                           launchURL();
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
                 elevation: 500,
                 color: Colors.transparent,
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
                         color: Colors.white70,
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
                  elevation: 500,
                  color: Colors.transparent,
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
                         color: Colors.white70,
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
              //  Card(
              //    color: Colors.transparent,
              //    semanticContainer: true,
              //    clipBehavior: Clip.antiAliasWithSaveLayer,
              //    child: Column(
              //      children: <Widget>[
              //        GestureDetector(
              //          child: Image.asset(
              //           'images/3.png', 
              //            width: size.width*.4,
              //            height: size.width*.4,
              //            fit: BoxFit.cover,
              //           // color: Colors.white70,
              //            ),
              //            onTap: () {
 
              //            },
              //        )
              //      ],
              //    ),
              //   ),
              //   Card(
              //     color: Colors.transparent,
              //    semanticContainer: true,
              //    clipBehavior: Clip.antiAliasWithSaveLayer,
              //    child: Column(
              //      children: <Widget>[
              //        GestureDetector(
              //          child: Image.asset(
              //           'images/3.png', 
              //            width: size.width*.4,
              //            height: size.width*.4,
              //            fit: BoxFit.cover,
              //            //color: Colors.white70,
              //            ),
              //            onTap: () {
                           
              //            },
              //        )
              //      ],
              //    ),
              //   ),
              ],
            ),
          ],
        ),
        padding:  EdgeInsets.only(
          left: size.width*.05, 
          right: size.width*.05,
          top: size.height*.03,
          bottom: size.height*.01),
      ),
    );
  }
}