import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  const url = 'https://www.amazon.com.br/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível acessar: $url';
  }
}