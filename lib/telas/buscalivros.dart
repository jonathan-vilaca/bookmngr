import 'package:bookmngr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';


// ignore: camel_case_types
class buscalivros extends StatefulWidget {
  @override
  _buscalivrosState createState() => _buscalivrosState();
}


// ignore: camel_case_types
class _buscalivrosState extends State<buscalivros>{
  Future getDados() async {
    Stream<DocumentSnapshot> dados = db.collection('bookmngr').
          document('livros').collection('titulo').document(pesquisa).snapshots();
  }

  
  String pesquisa;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('images/login.png'),
            fit: BoxFit.cover,
            ),
        ),
        child: 
          Column(
            children: <Widget>[
              SizedBox(
                  height: size.height*.23,
                  width: size.width,
                  child:
                    Container(alignment: Alignment.bottomLeft,
                      child: Text("Pesquise um título de livro:", 
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16),
                      textAlign: TextAlign.left),
                    ), 
                ),
                  TextField(
                    onChanged: (String busca) => {
                      pesquisa = busca
                    },
                      decoration: 
                        InputDecoration(
                      //labelText: 'Pesquisar',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    height: size.height*.01,
                  ),
                SizedBox(
                    height: size.height*.005,
                  ),
              ],
            ),
            padding:  EdgeInsets.only(
              left: size.width*.05, 
              right: size.width*.05,
              top: size.height*.03,
              bottom: size.height*.02),
        ),  
      );
    }
  }