import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


// ignore: camel_case_types
class buscalivros extends StatefulWidget {
  @override
  _buscalivrosState createState() => _buscalivrosState();
}


// ignore: camel_case_types
class _buscalivrosState extends State<buscalivros>{
    var db = Firestore.instance;
  
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
              SizedBox(//SEPARAR BOTÕES DE LOGIN
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
               Container(//BOTÃO ENTRAR VIA LOGIN BIBLIOTECÁRIO
                width: size.height,
                height: size.height * .07,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    Colors.indigo[700], 
                    Colors.indigo[50]]
                    )
                ),
                child:
                  SizedBox(
                    child: FlatButton(
                      child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[ 
                            Text("PESQUISAR",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          
                        }
                    ),
                    ),
                ),
                SizedBox(
                    height: size.height*.005,
                  ),
                Container(
                  child: StreamBuilder(
                    stream: db.collection('livros').snapshots(),
                    builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
                      if(snapshot.hasData){
                        return Center(child: CircularProgressIndicator());
                      }else{
                        return ListView(
                          children: snapshot.data.documents.map((livros){
                            return ListTile(
                              title: Text('Título: ' + livros['livros']['titulo']),
                            );
                          }).toList(),
                        );
                      }
                    },
                    ),

                )
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