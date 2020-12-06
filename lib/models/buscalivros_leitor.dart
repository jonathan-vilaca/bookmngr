import 'dart:async';
import 'package:bookmngr/models/updateLivros.dart';
import 'package:bookmngr/services/classeLivros.dart';
import 'package:bookmngr/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmngr/services/servicesLivros.dart';
import 'package:fluttertoast/fluttertoast.dart';

String pesquisa, pesquisar;

// ignore: camel_case_types
class Buscalivros_leitor extends StatefulWidget {
  @override
  _buscalivrosleitorState createState() => _buscalivrosleitorState();
}

// ignore: camel_case_types
class _buscalivrosleitorState extends State<Buscalivros_leitor>{
  TextEditingController buscador = TextEditingController();

  List <Livro> listaLivros = [];
  List <dynamic> livrosFiltrados = [];
  StreamSubscription<QuerySnapshot> listaInicial;

  @override
  void initState() {
     listaLivros = List();
     listaInicial?.cancel();
     listaInicial = 
     db.collection("acervo").snapshots().listen((snapshot) {
        List<Livro> livros = snapshot.documents
          .map(
            (documentSnapshot) => Livro.fromMap(
                documentSnapshot.data, 
                documentSnapshot.documentID),
          ).toList();
          buscador.addListener(() {
            filterSearch();
          });
           setState(() {
             this.listaLivros = livros;
           });
     });
     super.initState();
  }

  filterSearch() {
    List <Livro> _livros = [];
    _livros.addAll(listaLivros);
    if(buscador.text.isNotEmpty){
      _livros.retainWhere((busca){
        String searchLivro = buscador.text.toLowerCase();
        String tituloLivro = busca.titulo.toLowerCase();
        return tituloLivro.contains(searchLivro);
      });
      setState(() {
          livrosFiltrados = _livros;
      });
    }if(buscador.text.isEmpty){
      setState(() {
        return listaLivros;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    bool isSearching = buscador.text.isNotEmpty;
    var size = MediaQuery.of(context).size;   
    return Scaffold( 
      resizeToAvoidBottomPadding: false,    
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('images/desfoque.png'),
              fit: BoxFit.cover,
              ),
          ),
          child:
            Padding(
              padding:  EdgeInsets.only(
              left: size.width*.05, 
              right: size.width*.05,
              top: size.height*.05),
              child:
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                    Container(
                      height: size.height*.15,
                      width: size.width,
                      color: Colors.red,
                        child: Image.asset(
                          'images/topo.png', 
                            fit: BoxFit.cover,
                        )         
                      ),
                      SizedBox(
                          height: size.height*.035,
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
                          TextFormField(
                            autofocus: true,
                            controller: buscador,
                            onChanged: (String busca) {
                              filterSearch();
                            },
                            decoration: 
                              InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white70,
                              ),
                          ),
                    SizedBox(//SEPARADOR DE TEXTFIELD
                      height: size.height*.008,
                      width: size.width
                    ),
                      SizedBox(
                          height: size.height*.01,
                          width: size.width,
                      ),
                      Container(
                      width: size.width,
                      height: size.height*.61,
                      color: Colors.white70,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: StreamBuilder<QuerySnapshot>(
                          stream: buscarLivros(),
                          builder: (_, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return LinearProgressIndicator();
                            }else{
                              List<DocumentSnapshot> listagemLivros =
                            snapshot.data.documents;
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: isSearching == true? livrosFiltrados.length : listaLivros.length,
                                itemBuilder: (context, index){
                                  return
                                    ListTile(
                                      title: 
                                      ExpansionTile(
                                        title: Text(isSearching == true ? livrosFiltrados[index].titulo : listaLivros[index].titulo,
                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                            subtitle: listagemLivros[index]['disponivel'] == 'Disponível!' ? Text(
                                              listagemLivros[index]['disponivel'], style: TextStyle(color: Colors.green)) : 
                                               Text(listagemLivros[index]['disponivel'], style: TextStyle(color: Colors.red)),
                                      children: [
                                        Align(alignment: Alignment.centerLeft,
                                        child:
                                          Text(
                                              'Cod: '+ (isSearching == true ? livrosFiltrados[index].codigo :listaLivros[index].codigo) + '\n'
                                            'Autor: '+ (isSearching == true ? livrosFiltrados[index].autor :listaLivros[index].autor) + '\n'
                                          'Editora: '+ (isSearching == true ? livrosFiltrados[index].editora :listaLivros[index].editora) + '\n'
                                        'Gênero: '+ (isSearching == true ? livrosFiltrados[index].genero :listaLivros[index].genero) + '\n'
                                        'Ano: '+ (isSearching == true ? livrosFiltrados[index].ano :listaLivros[index].ano)),
                                        )],
                                      ),
                                    );
                                });
                            }
                          }),
                      )
                      )
                  ],
            ),
                ),
            ),
          ),
      )
      );
    }
}