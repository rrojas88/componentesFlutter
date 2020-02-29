import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = [
    'Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis', 'Siete', 'Ocho', 'NUeve', 'Diez', 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componente Temp'), 
      ),
      body: ListView(
        //children: _crearItems(),
        children: _crearListaCorta(),
      ),
    );
  }

  List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>(); // Lista dinamica
    for( String opt in opciones ){
      final tempWidget = ListTile(
        title: Text( opt ),
      );
      //lista.add( tempWidget );lista.add( Divider() );
      lista..add( tempWidget )
        ..add( Divider() );
    }
    return lista;
  }

  List<Widget> _crearListaCorta(){
    return opciones.map( (String opt) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text( opt + '..' ),
            subtitle: Text('Descripcion de '+ opt),
            trailing: Icon(Icons.add_call),
            onTap: (){ print('Click en el elemento de la lista'); },
          ),
          Divider()
        ],
      );
    }).toList();
  }

}