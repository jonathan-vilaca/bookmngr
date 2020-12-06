import 'package:flutter/material.dart';

class LoadingScreen {
  loading(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: CircularProgressIndicator(),
          ),         
        );
      },
    );
  }

  loadingClose(context){
    Navigator.pop(context, true);
  }
}

