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
    var db = Firestore.instance;
    QuerySnapshot dados = await db.collection('livros').getDocuments();
    return dados.documents;
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
                Container(
                  child: FutureBuilder(
                    future: getDados(),
                    builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(snapshot.data[index].data(pesquisa)),
                          );
                        });
                    }
                  }),
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