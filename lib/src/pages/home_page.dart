import 'package:flutter/material.dart';

import 'package:componentes/src/util/icono_string.dart';
import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista()
    );
  }

  Widget _lista() {
    
    /*print( menuProvider.opciones );
    menuProvider.cargarData()
      .then( (opciones){
        print('lista');
        print( opciones );
      });*/
    //return ListView(
    //  children: _listaItems(),
    //);
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot <List<dynamic>> snapshot ){
        print('build');
        print( snapshot.data );
        return ListView(
          children: _listaItems( snapshot.data, context ),
        );

      },
    );

  }

  List<Widget> _listaItems( List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach( (opt) {
      final widgetTmp = ListTile(
        leading: getIcon( opt['icon'] ),
        title: Text( opt['texto'] ),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){
          /*
          final route = MaterialPageRoute(
            builder: (context) => AlertPage()
          );
          Navigator.push(context, route); */

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add( widgetTmp )
        ..add( Divider() );
    });

    return opciones;
  }
}