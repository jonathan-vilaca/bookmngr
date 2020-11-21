import 'package:bookmngr/models/biblioopcoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void doLogin (BuildContext context, email, senha) async{
  AuthResult user = await FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: senha);

    if(user != null){
      try{
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => biblioopcoes()));
          Fluttertoast.showToast(
          msg: "SEJA BEM VINDO!",
          toastLength: Toast.LENGTH_SHORT);
      }catch (exception){
        print(exception);
        Fluttertoast.showToast(
          msg: "ERRO AO LOGAR!",
          toastLength: Toast.LENGTH_SHORT);
      }
    }
}