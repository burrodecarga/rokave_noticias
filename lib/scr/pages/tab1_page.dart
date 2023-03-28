import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokave_noticias/scr/services/news_service.dart';
import 'package:rokave_noticias/scr/widgets/lista_noticias.dart';

class Tab1Page extends StatefulWidget {
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newsService.headlines.isEmpty)
      ? const Center(
        child: CircularProgressIndicator()
      )
      :ListaNoticias(noticias: newsService.headlines),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

