import 'package:flutter/material.dart';
import 'package:midterm/pagina_contacto.dart';
import 'pagina_info.dart';
import 'pagina_contacto.dart';
import 'webview.dart';
import "menu.dart";

class tabsabajo extends StatefulWidget {
  _tabsabajoState createState() => _tabsabajoState();
}

class _tabsabajoState extends State<tabsabajo> {
  int myIndice = 0;
  final pantallas = <Widget>[
    PaginaInfo(),
    PaginaContacto(),
    webview("https://www.laloggia.mx/"),
    Menu(),
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      body: IndexedStack(index: myIndice, children: pantallas),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.orangeAccent,
          selectedItemColor: Colors.orange,
          iconSize: 40,
          currentIndex: myIndice, //Indice en el que esta la pantalla por incio
          onTap: (index) => setState(() {
                myIndice = index;
              }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: 'Inicio'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat), 
              label: 'Contacto'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), 
                label: 'Acerca'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant), 
                label: 'Menu'
            )
          ]),
      )
    );
  }
}
