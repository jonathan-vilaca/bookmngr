import 'package:bookmngr/services/servicesLivros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class buscalivros extends StatefulWidget {
  @override
  _buscalivrosState createState() => _buscalivrosState();
}


// ignore: camel_case_types
class _buscalivrosState extends State<buscalivros>{
  String pesquisa;
  List<buscalivros> livros = List();
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
                  height: size.height*.23,
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
                  TextField(
                    onChanged: (String busca) => {
                      setState((){
                        pesquisa = busca;
                      }),
                    },
                      decoration: 
                        InputDecoration(
                      //labelText: 'Pesquisar',
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
                Container(
                  width: size.width,
                  height: size.height*.6,
                  color: Colors.red,
                  child: Scaffold(
                    backgroundColor: Colors.indigo[300],
                    body: FutureBuilder(
                      future: buscarLivros(),
                      builder: (_, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return LinearProgressIndicator();
                        }else{
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index){
                              return
                                ListTile(
                                  title: Text(snapshot.data[index].data['titulo']),
                                  subtitle: Text('Código: '+snapshot.data[index].data['codigo'] + 
                                  ' | Autor: '+snapshot.data[index].data['autor']
                                  ),leading: Column(
                                    children: <Widget>[
                                      IconButton(
                                        icon: const Icon(Icons.delete), onPressed: (){
                                          deletarLivro(context, snapshot.data[index], index);
                                          setState(() {
                                            snapshot.data.removeAt(index);
                                          });
                                        })
                                    ],
                                  ),
                                );
                            });
                        }
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