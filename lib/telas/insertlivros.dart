import 'package:bookmngr/services/servicesLivros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'limparTextField.dart';

// ignore: camel_case_types
class insertlivros extends StatefulWidget {
  @override
  _insertlivrosstate createState() => _insertlivrosstate();
}

// ignore: camel_case_types
class _insertlivrosstate extends State<insertlivros>{

  String codigo, titulo, genero, editora, autor, ano, exemplares;
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
            TextFormField(//Código
              onChanged: (String cod){
                codigo = cod;
              },
                controller: cod,
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
            TextFormField(//titulo
              onChanged: (String tit){
                titulo = tit;
              },
                controller: liv,
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
                controller: gen,
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
                controller: ne,
                decoration: 
                  InputDecoration(
                    labelText: 'Número de exemplares',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.assignment),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                  keyboardType: TextInputType.number,
            ),
            SizedBox(//SEPARADOR DE TEXTFIELD
                height: size.height*.008,
                width: size.width
              ),
            TextField(//editora
              onChanged: (String edi){
                editora = edi;
              },
                controller: edi,
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
                controller: aut,
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
                controller: anoLa,
                decoration: 
                  InputDecoration(
                    labelText: 'Ano de lançamento',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                  keyboardType: TextInputType.number,
            ),
              SizedBox(
                height: size.height*.03,
              ),
            Container(//BOTÃO INSERIR LIVROS
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
                              insertLivro(codigo, titulo, genero, exemplares, editora, autor, ano);
                              Fluttertoast.showToast(
                                msg: "LIVRO CADASTRADO COM SUCESSO!",
                                toastLength: Toast.LENGTH_SHORT);
                                clearTextInput();
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
        padding:  EdgeInsets.only(
          left: size.width*.05, 
          right: size.width*.05,
          top: size.height*.03,
          bottom: size.height*.01),
      ),     
    );
  }
}