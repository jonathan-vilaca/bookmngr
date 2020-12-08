class Livro{
  String _codigo;
  String _titulo;
  String _editora;
  String _autor;
  String _genero;
  String _ano;
  String _disponivel;

  Livro(this._codigo, this._titulo, this._editora, this._autor, 
  this._genero, this._ano, this._disponivel);

  Livro.map(dynamic obj){
    this._ano = obj['ano'];
    this._autor = obj['autor'];
    this._codigo = obj['codigo'];
    this._editora = obj['editora'];
    this._genero = obj['genero'];
    this._titulo = obj['titulo'];
    this._disponivel = obj['disponivel'];
  }

  String get ano => _ano;
  String get autor => _autor;
  String get codigo => _codigo;
  String get titulo => _titulo;
  String get editora => _editora;
  String get genero => _genero;
  String get disponivel => _disponivel;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    if(_codigo != null){
      map['codigo'] = _codigo;
    }
    map['ano'] = _ano;
    map['autor'] = _autor;
    map['genero'] = _genero;
    map['titulo'] = _titulo;
    map['editora'] = _editora;
    map['disponivel'] = _disponivel;

    return map;
  }

  Livro.fromMap(Map<String, dynamic> map, String codigo){
    this._codigo = map['codigo'];
    this._ano = map['ano'];
    this._autor = map['autor'];
    this._editora = map['editora'];
    this._genero = map['genero'];
    this._titulo = map['titulo'];
    this._disponivel = map['disponivel'];
  }
}