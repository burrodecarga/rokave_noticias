import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rokave_noticias/scr/models/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a6cef8bfe374498ba50a87f9381cd8eb';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
  }

  String _selectedCountry = 'eeuu';
  String get selectedCountry => _selectedCountry;
  set selectedCountry(String value) {
    _selectedCountry = value;
    getArticlesByCategory(value);
  }

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology '),
  ];

  List<Country> paises = [
    Country(const Image(image: AssetImage('assets/chile.png')), 'chile','cl'),
    Country(const Image(image: AssetImage('assets/colombia.png')), 'colombia','c0'),
    Country(const Image(image: AssetImage('assets/eeuu.png')), 'eeuu','us'),
    Country(const Image(image: AssetImage('assets/espana.png')), 'españa','es'),
    Country(const Image(image: AssetImage('assets/venezuela.png')), 'venezuela','ve'),
  ];
  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
  }

  List<Article> get articulosPorCategoriaSeleccionada =>
      categoryArticles[selectedCategory]!;
  //http.get(Uri.parse(someString))

  //consumiendo API
  getTopHeadlines() async {
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    //consumiendo todos los encabezados de todos los articulos
    headlines.addAll(newsResponse.articles);

    //guardando cambios en el dispositivos
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.length > 0) {
      return categoryArticles[category];
    }
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY&category=$category');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category]?.addAll(newsResponse.articles);

    notifyListeners();
  }
}
