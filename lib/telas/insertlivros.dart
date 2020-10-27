import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class insertlivros extends StatefulWidget {
  @override
  _insertlivrosstate createState() => _insertlivrosstate();
}

// ignore: camel_case_types
class _insertlivrosstate extends State<insertlivros>{
  var db = Firestore.instance;
  
  _insert(a, s, d, f, g, h, j) async{
      db.collection('livros')
        .document(a)
          .setData(
          {
            "titulo":s,
            "genero":d,
            "exemplares":f,
            "editora":g,
            "autor":h,
            "ano":j,
          }
          );
  }
  String codigo = '', titulo, genero, editora, autor, ano, exemplares;
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
        child: Column(
          children: <Widget>[
            SizedBox(
                height: size.height*.22,
              ),
            TextField(//Código
              onChanged: (String cod){
                codigo = cod;
              },
                decoration: 
                  InputDecoration(
                    labelText: 'Código do livro',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.turned_in),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
            ),
            SizedBox(//SEPARADOR DE TEXTFIELD
                height: size.height*.008,
                width: size.width
              ),
            TextField(//titulo
              onChanged: (String tit){
                titulo = tit;
              },
                decoration: 
                  InputDecoration(
                    labelText: 'Título do livro',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.title),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
            ),
            SizedBox(//SEPARADOR DE TEXTFIELD
                height: size.height*.008,
                width: size.width
              ),
            TextField(//Gênero
              onChanged: (String gen){
                genero = gen;
              },
                decoration: 
                  InputDecoration(
                    labelText: 'Gênero',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
            ),
            SizedBox(//SEPARADOR DE TEXTFIELD
                height: size.height*.008,
                width: size.width
              ),
            TextField(//Exemplares
              onChanged: (String exe){
                exemplares = exe;
              },
                decoration: 
                  InputDecoration(
                    labelText: 'Número de exemplares',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.assignment),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
            ),
            SizedBox(//SEPARADOR DE TEXTFIELD
                height: size.height*.008,
                width: size.width
              ),
            TextField(//editora
              onChanged: (String edi){
                editora = edi;
              },
                decoration: 
                  InputDecoration(
                    labelText: 'Editora',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.collections_bookmark),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
            ),
            SizedBox(//SEPARADOR DE TEXTFIELD
                height: size.height*.008,
                width: size.width
              ),
            TextField(//Autor
              onChanged: (String aut){
                autor = aut;
              },
                decoration: 
                  InputDecoration(
                    labelText: 'Autor',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.contacts),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
            ),
            SizedBox(//SEPARADOR DE TEXTFIELD
                height: size.height*.008,
                width: size.width
              ),
            TextField(//Ano
              onChanged: (String lancamento){
                ano = lancamento;
              },
                decoration: 
                  InputDecoration(
                    labelText: 'Ano de lançamento',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
            ),
              SizedBox(
                height: size.height*.05,
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
                  SizedBox.expand(
                    child: FlatButton(
                      child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[ 
                            Text("CADASTRAR LIVRO",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          if((codigo.length > 0) && (codigo != null)){
                              _insert(codigo, titulo, genero, exemplares, editora, autor, ano);
                              Fluttertoast.showToast(
                                msg: "LIVRO CADASTRADO COM SUCESSO!",
                                toastLength: Toast.LENGTH_SHORT);
                          }else{
                            Fluttertoast.showToast(
                              msg: "FAVOR PREENCHER TODOS OS CAMPOS!",
                              toastLength: Toast.LENGTH_SHORT);
                          }
                        }),
                    ),
                ),
          ],
        ),
        padding: const EdgeInsets.all(25)
      ),     
    );
  }
}