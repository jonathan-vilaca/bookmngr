import 'package:bookmngr/models/biblioopcoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void doLogin (BuildContext context, email, senha) async{
  try{
    AuthResult user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: senha);
              loading(context);
      if(user != null){
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => biblioopcoes()));
            Fluttertoast.showToast(
            msg: "SEJA BEM VINDO!",
            toastLength: Toast.LENGTH_SHORT);
      }
  }catch (exception){
    print(exception);
    Fluttertoast.showToast(
      msg: "ERRO AO ENTRAR!",
      toastLength: Toast.LENGTH_SHORT);
}
}

void loading (BuildContext context){
    Scaffold(
      backgroundColor: Colors.transparent,
      body: CircularProgressIndicator(),
    );
}