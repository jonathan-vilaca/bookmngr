import 'package:bookmngr/services/linkAmazon.dart';
import 'package:bookmngr/models/buscalivros.dart';
import 'package:bookmngr/models/insertlivros.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class biblioopcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/desfoque.png'),
            fit: BoxFit.cover,
            ),
        ),
        child:
        Padding(
          padding: EdgeInsets.only(
            left: size.width*.05, 
            right: size.width*.05,
            top: size.height*.05,
            bottom: size.height*.03),
          child: 
            Column(
              children: <Widget>[
                Container(
                  height: size.height*.15,
                  width: size.width,
                  color: Colors.indigo,
                    child: Image.asset(
                      'images/topo.png', 
                        fit: BoxFit.cover,
                    )         
                  ),
                SizedBox(//SEPARAR BOTÕES DE LOGIN
                      height: size.height*.1,
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
                    FlatButton(
                      padding: EdgeInsets.only(
                        left: size.width*.005, 
                        right: size.width*.005,
                        top: size.height*.005,
                        bottom: size.height*.005),
                      color: Colors.transparent,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => insertlivros()));
                      },                   
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Image.asset(
                              'images/livro (2).png', 
                              width: size.width*.4,
                              height: size.width*.4,
                              fit: BoxFit.cover,
                              ),
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.only(
                        left: size.width*.005, 
                        right: size.width*.005,
                        top: size.height*.005,
                        bottom: size.height*.005),
                      color: Colors.transparent,
                      onPressed: (){
                        launchURL();
                      },                   
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Image.asset(
                              'images/livro (3).png', 
                              width: size.width*.4,
                              height: size.width*.4,
                              fit: BoxFit.cover,
                              ),
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
                    FlatButton(
                      padding: EdgeInsets.only(
                        left: size.width*.005, 
                        right: size.width*.005,
                        top: size.height*.005,
                        bottom: size.height*.005),
                      color: Colors.transparent,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => Buscalivros()));
                      },                   
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Image.asset(
                              'images/livro (1).png', 
                              width: size.width*.4,
                              height: size.width*.4,
                              fit: BoxFit.cover,
                              ),
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.only(
                        left: size.width*.005, 
                        right: size.width*.005,
                        top: size.height*.005,
                        bottom: size.height*.005),
                      color: Colors.transparent,
                      onPressed: (){
                        Fluttertoast.showToast(
                          msg: "Em breve...",
                          toastLength: Toast.LENGTH_SHORT);
                      },                   
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Image.asset(
                              'images/livro (5).png', 
                              width: size.width*.4,
                              height: size.width*.4,
                              fit: BoxFit.cover,
                              ),
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
          )
        ),
    );
  }
}