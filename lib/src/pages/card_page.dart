import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards ..'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 14, left: 14, right: 14),
        children: <Widget>[
          _cardTipo1(),
          SizedBox( height: 30.0,),
          _cardTipo2()
        ],
      )
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0, // Default: 1.0 => Sombra
      // Bordes Redondos
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assignment_return),
            title: Text('Tarjeta # 1'),
            subtitle: Text('Texto muy largo descriptivo. Texto muy largo descriptivo. Texto muy largo descriptivo. Texto muy largo descriptivo. '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){}
              ),
              Divider(),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){}
              ),
            ],
          )
        ],
      ),
    );
  }


  Widget _cardTipo2() { 
    //final card = Card(
    final card = Container(
      // Para que NADA de la targeta se salga de su espacio
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://image.freepik.com/foto-gratis/diseno-naturaleza-efecto-bokeh_1048-1882.jpg'),
            placeholder: AssetImage('assets/073 jar-loading.gif'),
            fadeInDuration: Duration(seconds: 2),
            height: 200.5,
            width: 380.0,
            // Comportamiento de la Imagen
            fit: BoxFit.cover
          ),
          //Text('Textooo'),
          //Image(
         //   image: NetworkImage('https://image.freepik.com/foto-gratis/diseno-naturaleza-efecto-bokeh_1048-1882.jpg')
          //),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Textooo de Descripcion ... okkkkkkkkkkkk'),
          )
        ],
      ),
    );

    return Container(
      //child: card,
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0)
      ),

      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius:  2.0,
            offset: Offset(2, 5)
          ),
        ]
      ),
    );

  }



}
