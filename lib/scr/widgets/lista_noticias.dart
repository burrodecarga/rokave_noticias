import 'package:flutter/material.dart';
import 'package:rokave_noticias/scr/models/news_models.dart';
import 'package:rokave_noticias/scr/theme/tema.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(noticia: noticias[index], index: index);
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          _TarjetaTopBar(noticia: noticia, index: index),
          _TarjetaTitulo(noticia: noticia, index: index),
          _TarjetaImagen(noticia: noticia, index: index),
          _TarjetaBody(noticia: noticia, index: index),
          _TarjetaFooter(noticia: noticia),
          const SizedBox(height: 10),
          const Divider(),
        ],
      ),
    );
  }
}

class _TarjetaFooter extends StatelessWidget {
  final Article noticia;
  const _TarjetaFooter({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.black12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(
          width: 20,
        ),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.black12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more),
        ),
      ]),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaBody({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (noticia.description != null)
            ? Text(noticia.description!)
            : const Text('No description'));
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaImagen({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage!))
                : const Image(image: AssetImage('assets/no-image.png'))),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTitulo({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(noticia.title!,
          style: TextStyle(fontSize: 14.0, color: myTheme.colorScheme.primary)),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text('${index + 1}',
            style:
                TextStyle(fontSize: 16.0, color: myTheme.colorScheme.primary)),
        const SizedBox(
          width: 10,
        ),
        Text(noticia.source.name,
            style:
                TextStyle(fontSize: 16.0, color: myTheme.colorScheme.primary)),
      ]),
    );
  }
}
