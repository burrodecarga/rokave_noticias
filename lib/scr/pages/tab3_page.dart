import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokave_noticias/scr/models/models.dart';
import 'package:rokave_noticias/scr/services/news_service.dart';

class Tab3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(child: _ListadoPaises()),
        ],
      ),
    ));
  }
}

class _ListadoPaises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paises = Provider.of<NewsService>(context).paises;

    
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: paises.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _CountryButton(pais: paises[index]),
              Text(paises[index].name),
            ],
          ),
        );
      },
    );
  }
}

class _CountryButton extends StatelessWidget {
  final Country pais;
  const _CountryButton({required this.pais});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 160,
        height: 160,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          ),
        child: pais.image,
      )
    );
  }
}
