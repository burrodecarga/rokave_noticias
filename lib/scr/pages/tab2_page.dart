import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokave_noticias/scr/models/category_model.dart';
import 'package:rokave_noticias/scr/services/news_service.dart';
import 'package:rokave_noticias/scr/widgets/lista_noticias.dart';
import 'package:string_capitalize/string_capitalize.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          _ListaCategorias(),
          Expanded(child: ListaNoticias(noticias: newsService.articulosPorCategoriaSeleccionada)),
        ],
      ),
    ));
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 118,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: 110,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _CategoryButton(categoria: categories[index]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(categories[index].name.capitalize()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton({required this.categoria});

  @override
  Widget build(BuildContext context) {
       final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        //print('${categoria.name.capitalize()}');
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory=categoria.name;

      },
      child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            categoria.icon,
            color:(newsService.selectedCategory == categoria.name) 
            ?Colors.red[400] 
            : Colors.black54,
          )),
    );
  }
}
