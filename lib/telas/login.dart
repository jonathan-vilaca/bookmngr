import 'package:bookmngr/telas/biblioopcoes.dart';
import 'package:bookmngr/telas/novoleitor.dart';
//import 'package:bookmngr/telas/novoleitor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';


// ignore: camel_case_types
class login extends StatefulWidget{
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  String usuario, senha, tipousuer;
  var db = Firestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  _login() async {
    try{
      await _googleSignIn.signIn();
    }catch(err){
      print(err);
    }
  }
  _logout(){
    try{
      _googleSignIn.signOut();
    }catch(err){
      print(err);
    }

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
        child:
          Column(
            children: <Widget>[
              SizedBox(
                height: size.height*.22,
              ),
              Row(//Icones de usuarios 
                mainAxisAlignment: MainAxisAlignment.spaceAround,            
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'images/3.png',                       
                        width: size.width * .5,
                        height: size.width * .5,                        
                         fit: BoxFit.cover,
                         ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height*.03,
              ),
              SizedBox(//SEPARAR BOTÕES DE LOGIN
                height: size.height*.03,
                width: size.width,    
                child:Text("LOGAR COMO BIBLIOTECÁRIO(A):",
                  style: TextStyle(
                  color: Colors.white,               
                ),textAlign: TextAlign.left
                ),
              ),
                TextField(//USUARIO                                  
                  onChanged: (String user){
                    usuario = user;
                  },
                  decoration:
                    InputDecoration(
                      labelText: 'Usuário',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.account_box),
                      filled: true,
                    fillColor: Colors.white70,
                 ),
                ),
              SizedBox(
                height: size.height*.01,
              ),
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
              SizedBox(
                height: size.height*.04,
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
                            Text("ENTRAR",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => biblioopcoes()));
                        }),
                    ),
                ),
                SizedBox(//SEPARAR BOTÕES DE LOGIN
                  height: size.height*.025,
                  width: size.width,
                  child: Text("ou", style: TextStyle(
                    color: Colors.white,               
                  ),textAlign: TextAlign.center
                  ),
                ),
              Container(//BOTÃO ENTRAR VIA GOOGLE
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
                            Text("LOGAR COMO LEITOR   ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ),
                            Container(
                              child: SizedBox(
                                height: size.height * .06,
                                width: size.width * .06,
                                child: Image.asset('images/google.png', alignment: Alignment.centerRight,),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          //_login();
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => novoleitor()));
                        }),
                    ),
                ), 
            ],
          ),
          padding: EdgeInsets.all(25),
      ),
    );
  }
}