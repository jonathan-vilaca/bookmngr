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
            Container(
              height: size.height*.25,
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
                        'images/acervoicon.png', 
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
                         color: Colors.amber[600],
                         ),
                         onTap: () {
                           
                         },
                     )
                   ],
                 ),
                ),
              ],
            ),
            Container(
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
                        'images/acervoicon.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
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
                        'images/acervoicon.png', 
                         width: size.width*.4,
                         height: size.width*.4,
                         fit: BoxFit.cover,
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