import 'package:bookmngr/models/resultAcervo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String pesquisa, pesquisar;

// ignore: camel_case_types
class buscalivros extends StatefulWidget {
  @override
  _buscalivrosState createState() => _buscalivrosState();
}

// ignore: camel_case_types
class _buscalivrosState extends State<buscalivros>{
  TextEditingController buscador = TextEditingController();
  
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
            image: AssetImage('images/desfoque.png'),
            fit: BoxFit.cover,
            ),
        ),
        child: 
          Column(
            children: <Widget>[
            Container(
              height: size.height*.20,
              width: size.width,
              color: Colors.red,
                child: Image.asset(
                  'images/topo.png', 
                    fit: BoxFit.cover,
                )         
              ),
              SizedBox(
                  height: size.height*.05,
                  width: size.width,
                  child:
                    Container(alignment: Alignment.bottomLeft,
                      child: Text("Pesquise um título de livro:", 
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16),
                      textAlign: TextAlign.left),
                    ), 
                ),
                  TextFormField(
                    controller: buscador,
                    onChanged: (busca) {
                      setState(() {
                         pesquisa = busca;
                      });
                    },
                    decoration: 
                      InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                  ),
            SizedBox(//SEPARADOR DE TEXTFIELD
              height: size.height*.008,
              width: size.width
            ),
             Container(//BOTÃO INSERIR LIVROS
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
                            Text("PESQUISAR",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => resultadoAcervo()));
                        }),
                    ),
                ),
          ],
        ),
        padding:  EdgeInsets.only(
          left: size.width*.05, 
          right: size.width*.05,
          top: size.height*.03,
          bottom: size.height*.02),
        ),  
      );
    }
  }