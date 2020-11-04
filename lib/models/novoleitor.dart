import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class novoleitor extends StatefulWidget {
  @override
  _novoleitorState createState() => _novoleitorState();
}

// ignore: camel_case_types
class _novoleitorState extends State<novoleitor> {
  var db = Firestore.instance;

  _newleitor(usuario, senha) async{
    var db = Firestore.instance;
     db.collection('leitor')
        .document('teste')
          .setData(
            {
            "nome":usuario,
            "senha":senha
            }
          );
  }

  String novousuario, novasenha, repetesenha;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/desfoque.png'),
            fit: BoxFit.cover,
            ),
        ),
        child:
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25)
              ),
              Container(
                child: Image(
                  width: double.infinity,
                  height: 250,
                  image: AssetImage('images/novoleitor.png')),
              ),
              Padding(padding: const EdgeInsets.all(30)),
                TextField(//USUARIO                                  
                  onChanged: (newuser){
                    novousuario = newuser;
                  },
                  decoration: 
                    InputDecoration(
                      labelText: 'Nome do suário',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.supervised_user_circle),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                ),
            Padding(padding: const EdgeInsets.all(10),),
            TextField(//SENHA   
              onChanged: (newpass){
                  novasenha = newpass;
                },          
              obscureText: true,
              decoration:
                InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.enhanced_encryption),
                  filled: true,
                  fillColor: Colors.white70,                
                ),
              ),
            Padding(padding: const EdgeInsets.all(10)),
            TextField(//Repetir SENHA   
              onChanged: (repeatpass){
                  repetesenha = repeatpass;
                },          
              obscureText: true,
              decoration:
                InputDecoration(
                  labelText: 'Digite a senha novamente',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.enhanced_encryption),
                  filled: true,
                  fillColor: Colors.white70,                
                )
              ),
            Padding(padding: const EdgeInsets.all(30)),
            RaisedButton(
                      splashColor: Colors.blue[900],
                      textColor: Colors.black87,
                      color: Colors.indigo[100],
                      onPressed: (){//Botão de criação de novo leitor  
                        try{                   
                        _newleitor(novousuario, novasenha);
                        Fluttertoast.showToast(
                            msg: "USUÁRIO CADASTRADO COM SUCESSO!",
                            toastLength: Toast.LENGTH_SHORT,

                          );  
                        }catch(error){
                          Fluttertoast.showToast(
                            msg: "USUÁRIO NÃO CADASTRADO!",
                            toastLength: Toast.LENGTH_SHORT,

                          );
                        }                 
                      },
                        child:
                          Text('CADASTRAR'),
                  )
            ],
          ),
          padding: EdgeInsets.all(25),
      ),
    );
  }
}
