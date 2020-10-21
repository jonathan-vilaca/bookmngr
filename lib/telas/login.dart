import 'package:bookmngr/telas/biblioopcoes.dart';
import 'package:bookmngr/telas/novoleitor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


// ignore: camel_case_types
class login extends StatefulWidget{
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  String usuario, senha, tipousuer;
  var db = Firestore.instance;

   void initState() {//Iniciar a tela com o radio leitor habilitado
    setState(() {
      tipousuer = 'leitor';
    });
    super.initState();
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
            image: AssetImage('images/telazero.png'),
            fit: BoxFit.cover,
            ),
        ),
        child:
          Column(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('images/logobook.png')),
                ),
                Padding(padding: const EdgeInsets.all(20)),
              Row(//Icones de usuarios 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(image: AssetImage('images/bb.png'), 
                    width: size.width * .4,
                    height: size.width * .45),
                  Image(image: AssetImage('images/bl.png'),
                    width: size.width * .4,
                    height: size.width * .45)
                ],
              ),
              Row(//Radiobuttons
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[    
                  Radio(
                    value: 'biblio',
                    activeColor: Colors.blue[900],  
                    groupValue: tipousuer,
                    onChanged: (String valor){
                      setState(() {
                        tipousuer = valor;
                      });
                    }),
                  Radio(
                    value: 'leitor',
                    activeColor: Colors.amber[100], 
                    groupValue: tipousuer, 
                    onChanged: (String valor){                      
                      setState(() {
                        tipousuer = valor;
                      });
                    })
                ],
              ),
              Padding(padding: const EdgeInsets.all(10)),
                TextField(//USUARIO                                  
                  onChanged: (String user){
                    usuario = user;
                  },
                  decoration:
                    InputDecoration(
                      labelText: 'Usuário',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.supervised_user_circle),
                      filled: true,
                    fillColor: Colors.white70,
                 ),
                ),
            Padding(padding: const EdgeInsets.all(10),),
            TextField(//SENHA   
              onChanged: (String pass){
                  senha = pass;
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
            Padding(padding: const EdgeInsets.all(20)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      splashColor: Colors.blue[900],
                      textColor: Colors.black87,
                      color: Colors.indigo[100],
                      onPressed: (){//Botão de validação do usuário
                        if (tipousuer == 'biblio') {
                          if ((usuario == null && senha == null)) {
                            Fluttertoast.showToast(
                                msg: "Digite um Usuário e Senha!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1);
                          } else if ((usuario == null || usuario.length <= 0)) {
                            Fluttertoast.showToast(
                                msg: "Digite um Usuário!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1);
                          } else if ((senha == null || usuario.length <= 0)) {
                            Fluttertoast.showToast(
                                msg: "Digite uma Senha!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1);            
                          }else{                          
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => biblioopcoes()));
                          }
                        } else if(tipousuer == 'leitor') {

                        }                       
                      },
                        child:
                          Text('ENTRAR'),
                  ),
                  RaisedButton(
                      splashColor: Colors.amber[100],
                      textColor: Colors.black87,
                      color: Colors.indigo[100],
                      onPressed: (){//Botão de cadastrar novo leitor
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => novoleitor()));
                      },
                        child:
                          Text('NOVO LEITOR'),
                  ),
                  ]),
            ],
          ),
          padding: EdgeInsets.all(25),
      ),
    );
  }
}