import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmngr/services/servicesLivros.dart';

String pesquisa, pesquisar;

// ignore: camel_case_types
class buscalivros extends StatefulWidget {
  @override
  _buscalivrosState createState() => _buscalivrosState();
}

// ignore: camel_case_types
class _buscalivrosState extends State<buscalivros>{
  TextEditingController buscador = TextEditingController();
  List <String> livros = [];
  List <dynamic> filteredLivros = [];

  @override
  void initState() {
    buscarLivros().then((data) {
      setState(() {
        filteredLivros.addAll(data);
        livros.addAll(data);
      });
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
                  height: size.height*.035,
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
                      filterSearch(busca);
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
              SizedBox(
                  height: size.height*.01,
                  width: size.width,
              ),
              Container(
              width: size.width,
              height: size.height*.6,
              color: Colors.white70,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: FutureBuilder(
                  future: buscarLivros(),
                  builder: (_, snapshot) {
                    //var livros = snapshot.data;
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return LinearProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: filteredLivros.length,
                        itemBuilder: (context, index){
                          return
                            ListTile(
                              //Chamar tela de atualizar livros
                              //onLongPress: ,
                              title: 
                              ExpansionTile(
                                title: Text(filteredLivros[index].data['titulo'],
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('Cod: '+ filteredLivros[index].data['codigo'] + 
                              ' | Autor: '+ filteredLivros[index].data['autor'],),
                              children: [
                                Align(alignment: Alignment.centerLeft,
                                child:
                                  Text('Editora: '+ filteredLivros[index].data['editora'] + '\n'
                                'Gênero: '+ filteredLivros[index].data['genero'] + '\n'
                                'Ano: '+ filteredLivros[index].data['ano']),
                                )],
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
                                                deletarLivro(context, filteredLivros[index], index);
                                                setState(() {
                                                  filteredLivros.removeAt(index);
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
              )
          ],
        ),
        padding:  EdgeInsets.only(
          left: size.width*.05, 
          right: size.width*.05,
          top: size.height*.03,
          bottom: size.height*.03),
        ),  
      );
    }


  filterSearch(String query) {
    List<String> searchList = List<dynamic>();
    searchList.addAll(livros);
    if (query.isNotEmpty) {
      List<String> resultListData = List<dynamic>();
      searchList.forEach((item) {
        if (item.contains(query)) {
          resultListData.add(item);
        }
      });
      setState(() {
        filteredLivros.clear();
        filteredLivros.addAll(resultListData);
      });
      return;
    } else {
      setState(() {
        filteredLivros.clear();
        filteredLivros.addAll(livros);
      });
    }
  }
}