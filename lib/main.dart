import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokave_noticias/scr/pages/tab_pages.dart';
import 'package:rokave_noticias/scr/services/news_service.dart';
import 'package:rokave_noticias/scr/theme/tema.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=>NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        title: 'Noticias App',
        home: TabsPage()
        
        
      ),
    );
  }
}