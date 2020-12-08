import 'dart:io';

import 'package:bookmngr/models/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBack{
    static Future <bool> onBackPressed(context) {
    return showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: new Text('Deseja finalizar a aplicação?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context, false),
            child: new Text('Não'),
          ),
          new FlatButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context, false);
              exit(0);
            },
            child: new Text('Sim'),
          ),
        ],
      ),
    ) ?? false;
  }
}