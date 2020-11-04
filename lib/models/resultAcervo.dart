import 'package:bookmngr/services/servicesLivros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resultadoAcervo extends StatefulWidget {
  @override
  _resultadoAcervoState createState() => _resultadoAcervoState();
}

// ignore: camel_case_types
class _resultadoAcervoState extends State<resultadoAcervo> {
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
                  height: size.height*.01,
                  width: size.width,
              ),
              Container(
              width: size.width,
              height: size.height*.73,
              color: Colors.white70,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: FutureBuilder(
                  future: buscarLivros(),
                  builder: (_, snapshot) {
                    var livros = snapshot.data;
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return LinearProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: livros.length,
                        itemBuilder: (_, index){
                          return
                            ListTile(
                              title: 
                              ExpansionTile(
                                title: Text(livros[index].data['titulo'],),
                                subtitle: Text('Cod: '+livros[index].data['codigo'] + 
                              ' | Autor: '+livros[index].data['autor'],),
                              children: [
                                Text('Editora: '+livros[index].data['editora'] + '\n'
                              'Gênero: '+livros[index].data['genero'] + '\n'
                              'Ano: '+livros[index].data['ano'],),
                              ],
                              ),leading: Column( 
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: (){
                                      showCupertinoDialog(
                                      context: context, 
                                      builder: (context){
                                        return CupertinoAlertDialog(
                                          title: Text('ATENÇÃO!'),
                                          content: Text('Deseja realmente deletar o livro?'),
                                          actions: [
                                            CupertinoDialogAction(child: Text('SIM'),
                                              isDestructiveAction: true,
                                              onPressed: (){
                                                deletarLivro(context, livros[index], index);
                                                setState(() {
                                                  livros.removeAt(index);
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                            CupertinoDialogAction(child: Text('NÃO'),
                                              isDestructiveAction: true,
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                    }),
                                ],
                              ),
                            );
                        });
                    }
                  }),
              )
              )],
          ),
          padding:  EdgeInsets.only(
            left: size.width*.03, 
            right: size.width*.03,
            top: size.height*.03,
            bottom: size.height*.01),
      ),
    );
  }
}