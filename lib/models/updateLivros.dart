import 'package:bookmngr/models/limparTextField.dart';
import 'package:bookmngr/services/servicesLivros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class UpdateLivros extends StatefulWidget {
  @override
  _updateLivrosstate createState() => _updateLivrosstate();
}

  var cod2 = TextEditingController();
  var liv2 = TextEditingController();
  var gen2 = TextEditingController();
  var edi2 = TextEditingController();
  var aut2 = TextEditingController();
  var anoLa2 = TextEditingController();

// ignore: camel_case_types
class _updateLivrosstate extends State<UpdateLivros>{


  bool state = true;
  String codigo = '', titulo = '', genero = '', editora = '', 
        autor = '', ano = '', exemplares = '', disponivel = '';

  @override
  Widget build(BuildContext context) {    
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('images/desfoque.png'),
            fit: BoxFit.cover,
            ),
        ),
        child: SingleChildScrollView(
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
                SizedBox(//SEPARADOR DE TEXTFIELD
                  height: size.height*.008,
                  width: size.width
                ),
              Container(
                color: Colors.white70,
                height: size.height*.05,
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                          Text("DISPONIBILIDADE",style: TextStyle(color: Colors.black87)),
                      Switch(
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.redAccent,
                        value: state, 
                        onChanged: (bool value){
                          setState(() {
                            state = value;
                          });        
                        }),
                    ],
                  ), 
                ),
                SizedBox(//SEPARADOR DE TEXTFIELD
                  height: size.height*.008,
                  width: size.width
                ),
              TextFormField(//Código
                onChanged: (String cod){
                  codigo = cod;
                },
                  controller: cod2,
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
                  controller: liv2,
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
                  controller: gen2,
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
              TextField(//editora
                onChanged: (String edi){
                  editora = edi;
                },
                  controller: edi2,
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
                  controller: aut2,
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
                  controller: anoLa2,
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
                  height: size.height*.015,
                ),
              Container(//BOTÃO CADASTRAR LIVROS
                  width: size.height,
                  height: size.height * .07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown[400], 
                        Colors.brown[100]]
                      )
                  ),
                  child:
                    SizedBox.expand(
                      child: FlatButton(
                        child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[ 
                              Text("ATUALIZAR LIVRO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if((codigo.length > 0) && (codigo != null) &&
                              (titulo.length > 0) && (titulo != null) &&
                              (genero.length > 0) && (genero != null) &&
                              (editora.length > 0) && (editora != null) &&
                              (autor.length > 0) && (autor != null) &&
                              (ano.length > 0) && (ano != null)){
                              if (state == true){
                                disponivel = 'Disponível!';
                              }else{
                                disponivel = 'Indisponível!';
                              }
                              updateLivro(codigo, titulo, genero, editora, autor, ano, disponivel);
                              Fluttertoast.showToast(
                                msg: "LIVRO ATUALIZADO COM SUCESSO!",
                                toastLength: Toast.LENGTH_SHORT);
                            }else{
                              Fluttertoast.showToast(
                                msg: "FAVOR PREENCHER TODOS OS CAMPOS!",
                                toastLength: Toast.LENGTH_SHORT);
                            }
                            setState(() {
                              state = true;
                            });
                          }),
                      ),
                  ),
                SizedBox(
                  height: size.height*.01,
                ),
                Container(//BOTÃO LIMPAR
                  width: size.height,
                  height: size.height * .07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown[400], 
                        Colors.brown[100]]
                      )
                  ),
                  child:
                    SizedBox.expand(
                      child: FlatButton(
                        child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[ 
                              Text("LIMPAR",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              limparTextfieldsUpdate();
                              state = true; 
                            });               
                          }),
                      ),
                  ),
            ],
          ),
        ),
        padding:  EdgeInsets.only(
          left: size.width*.05, 
          right: size.width*.05,
          top: size.height*.05,
          bottom: size.height*.03),
        ),    
    );
  }
}

chamarTelaCadastro(context, cod, tit, gen, edi, aut, ano){

  Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => UpdateLivros()));

  String codigo = cod;
  String titulo = tit;
  String genero = gen;
  String editora = edi;
  String autor = aut;
  String anoLa = ano;

  cod2.text = codigo;
  liv2.text = titulo;
  gen2.text = genero;
  edi2.text = editora;
  aut2.text = autor;
  anoLa2.text = anoLa;

}

limparTextfieldsUpdate(){
  cod2.clear();
  liv2.clear();
  gen2.clear();
  edi2.clear();
  aut2.clear();
  anoLa2.clear();
}