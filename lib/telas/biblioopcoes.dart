import 'package:flutter/material.dart';

// ignore: camel_case_types
class biblioopcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/telazero.png'),
            fit: BoxFit.cover,
            ),
        ),
        child: 
        Column(
          children: <Widget>[
            Container(
              child: Image(
                  image: AssetImage('images/logobook.png')),
            ),
            Padding(padding: const EdgeInsets.all(25)),
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
                         width: 150,
                         height: 150,
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
                         width: 150,
                         height: 150,
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
            Padding(padding: const EdgeInsets.all(15)),
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
                         width: 150,
                         height: 150,
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
                         width: 150,
                         height: 150,
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