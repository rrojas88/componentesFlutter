import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


class _MenuProvider {
  
  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
  }

  Future <List <dynamic> > cargarData() async { 

    final resp = await rootBundle.loadString('data/mi-menu.json');
    Map dataMap = json.decode( resp );
    opciones = dataMap['rutas'];

    return opciones;
     /* .then( (data) {
        Map dataMap = json.decode( data );
        print( dataMap );
        print( dataMap['rutas'] );
        opciones = dataMap['rutas'];
      });*/
  }

}

final menuProvider = new _MenuProvider();
