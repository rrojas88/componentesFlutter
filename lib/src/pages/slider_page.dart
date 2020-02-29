import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  //SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;

  bool _bloqueaCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only( top: 50.0 ),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Divider(),
            _crearChecks(),
            _crearSwitch(),
            Divider(),
            Expanded(
              child: _crearImagen()
            )
        ],),
      )
    );
  } 


   
  void _cambiarTamano (valor){
    _valorSlider = valor;

    setState(() {
    });
  }


  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño img',
      divisions: 20,

      value: _valorSlider,
      min: 10.0,
      max: 400.0, 
      onChanged: (_bloqueaCheck)? null : ((valor){ _cambiarTamano(valor); })
    );
  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage( 'https://external-preview.redd.it/AmsGqUMqkvX5B5fU6s0-SgXwg9eUxX-DlRL0PI2UWbQ.jpg?auto=webp&s=d8e8e6cb5ce399851ea6568be97c213304a9bd72' ),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

  Widget _crearChecks() {

    /*return Checkbox(
      value: _bloqueaCheck, 
      onChanged: ( valor ){
        _bloqueaCheck = valor;
        setState(() { });
      }
    );*/
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloqueaCheck, 
      onChanged: ( valor ){
        _bloqueaCheck = valor;
        setState(() { });
      }
    );

  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloqueaCheck, 
      onChanged: ( valor ){
        _bloqueaCheck = valor; 
        setState(() { });
      }
    );

  }


}