import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_3/screens/home_screen.dart';
import 'package:flutter_application_3/screens/perfilCompleto.dart';
import 'package:flutter_application_3/screens/view_pub.dart';
import 'package:flutter_application_3/utils/responsive.dart';
import 'package:flutter_application_3/views/comentario.dart';
import 'package:flutter_application_3/views/perfil.dart';
import 'package:flutter_application_3/views/publica.dart';

class raiz extends StatefulWidget {
  raiz({Key? key}) : super(key: key);

  @override
  State<raiz> createState() => _raizState();
}

class _raizState extends State<raiz> {
  int _page = 0;

  final perfilCompleto _perfil = new perfilCompleto();
  final publicacionPerfil _pubPerfil = new publicacionPerfil();
  final Perfil _perfilBotton = new Perfil();
  final home_screen _homeScreen = new home_screen();
  final comentario _comentario = new comentario();
  final viewPub _viewpub = new viewPub();

  Widget _showPage = new home_screen();
  Widget _pageChoser(int page) {
    switch (page) {
      case 0:
        return _homeScreen;

      case 1:
        return _comentario;

      case 2:
        return _viewpub;

      case 3:
        return _pubPerfil;

      case 4:
        return _perfil;

      default:
        return const Center(
          child: Text(
            'No se encontro la pagina. ',
            style: TextStyle(fontSize: 30),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.favorite,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.person,
        size: 30,
        color: Colors.white,
      ),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          //buttonBackgroundColor: Colors.black,
          color: Colors.pink,
          height: resposive.hp(6),
          index: _page,
          items: items,
          onTap: (int tappedIndex) {
            setState(() {
              //print(tappedIndex);
              _showPage = _pageChoser(tappedIndex);
            });
          }),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
