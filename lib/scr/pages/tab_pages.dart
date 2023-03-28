import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokave_noticias/scr/pages/tab1_page.dart';
import 'package:rokave_noticias/scr/pages/tab2_page.dart';
import 'package:rokave_noticias/scr/pages/tab3_page.dart';

// ignore: use_key_in_widget_constructors
class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
        controller: navegacionModel.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Tab1Page(),
          Tab2Page(),
          Tab3Page(),
        ]);
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (value) => navegacionModel.paginaActual = value,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Para ti'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Noticias'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city_sharp), label: 'Pais'),
        ]);
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int value) {
    _paginaActual = value;
    _pageController.animateToPage(value,
        duration: Duration(microseconds: 550), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
