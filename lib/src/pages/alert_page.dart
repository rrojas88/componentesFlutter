import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Ver Alerta !'),
          color: Colors.green,
          textColor: Colors.yellow,
          shape: StadiumBorder(),
          onPressed: () => _verAlerta( context ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _verAlerta(BuildContext context) {

    showDialog(
      context: context,
      // Permitir Cerrar al dar click Fuera del Dialogo:
      barrierDismissible:  true,
      builder: (context){

        return AlertDialog(
          title: Text('Tiulo Alerta'),
          titlePadding: EdgeInsets.all(10.0),
          // Borde redondo
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          
          backgroundColor: Colors.lime,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido del Diálogo'),
              FlutterLogo( size: 100,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              // Cerrar el Modal
              onPressed: ()=> Navigator.of(context).pop(), 
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                // Cerrar el Modal
                Navigator.of(context).pop();
              }, 
            )
          ],
        );
      }
    );

  }

}



