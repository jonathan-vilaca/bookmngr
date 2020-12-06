import 'package:bookmngr/models/biblioopcoes.dart';
import 'package:bookmngr/services/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void doLogin (BuildContext context,TextEditingController email, TextEditingController senha) async{
  String userEmail = email.text.trim();
  String pass = senha.text;
  try{
    AuthResult user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: userEmail, password: pass);
      LoadingScreen().loadingClose(context);
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
      msg: "USUÁRIO INCORRETO!",
      toastLength: Toast.LENGTH_SHORT);
      Navigator.pop(context);
  }
}