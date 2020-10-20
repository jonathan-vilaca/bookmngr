import 'package:flutter/material.dart';

// ignore: camel_case_types
class novoleitor extends StatefulWidget {
  @override
  _novoleitorState createState() => _novoleitorState();
}

// ignore: camel_case_types
class _novoleitorState extends State<novoleitor> {
  String novousuario = '', novasenha = '', repetesenha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/telazero.png'),
            fit: BoxFit.cover,
            ),
        ),
        child:
          Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(25)),
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
            Padding(padding: const EdgeInsets.all(20)),
            RaisedButton(
                      splashColor: Colors.blue[900],
                      textColor: Colors.black87,
                      color: Colors.indigo[100],
                      onPressed: (){//Botão de criação de novo leitor



                        
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