import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class buscalivros extends StatefulWidget {
  @override
  _buscalivrosState createState() => _buscalivrosState();
}

class _buscalivrosState extends State<buscalivros>{
  var db = Firestore.instance;

  _buscar() async {
    QuerySnapshot buscar = await db.collection("livros").getDocuments();
    
    buscar.documents.forEach((cadalivro) {
      cadalivro.exists;
    });
  }
  

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
      ),
    );
  }
}