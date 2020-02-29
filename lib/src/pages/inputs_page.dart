import 'package:flutter/material.dart';

class Inputs1Page extends StatefulWidget {
  //Inputs1Page({Key key}) : super(key: key);

  @override
  _Inputs1PageState createState() => _Inputs1PageState();
}

class _Inputs1PageState extends State<Inputs1Page> {

  String _nombre = '';
  String _email = '';
  String _pass = '';

  TextEditingController _inputFecha = new TextEditingController();
  String _fecha = '';

  List<String> _poderes = ['Volar', 'Raoys X', 'Super Fuerza', 'Ver a través de paredes'];
  String _select = 'Volar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
          Divider(),
          _crearEmail(),         
          Divider(),
          _crearPassword(),         
          Divider(),
          _crearFecha(context),         
          Divider(),
          _crearDropDown(),
          Divider(),
        ],
      ),
    );
  }

  void _updateState({String campo, String valor}){

    if( campo == '_nombre' )
      _nombre = valor;
    else if( campo == '_email' )
      _email = valor;
    else if( campo == '_pass' )
      _pass = valor;
    else if( campo == '_fecha' ){
      _fecha = valor;

      _inputFecha.text = _fecha;
    }
    else if( campo == '_select' )
      _select = valor;
    

    setState(() {
      
    });
  }

  Widget _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Cantidad: ${_nombre.length}'),
        hintText: 'Nombre Persona.. placeholder',
        labelText: 'Nombre',
        helperText: 'Aca va tu nombre.. validadiones ?',
        // Derecha
        icon: Icon( Icons.account_box ),
        //Izquierda
        suffixIcon: Icon(Icons.accessibility)
      ),
      onChanged: (valor){
        _nombre = valor;

        _updateState(campo:'_nombre', valor: valor);
      },
    );

  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Cantidad: ${_nombre.length}'),
        hintText: 'Correo',
        labelText: 'E-mail',
        helperText: 'Aca va e-mail',
        // Derecha
        icon: Icon( Icons.email ),
        //Izquierda
        suffixIcon: Icon(Icons.alternate_email)
      ),
      onChanged: (valor){
        _updateState(campo:'_email', valor: valor);
      },
    );
  }


  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Cantidad: ${_nombre.length}'),
        hintText: 'Password',
        labelText: 'cONTRASEÑA',
        helperText: 'Aca tu pass',
        // Derecha
        icon: Icon( Icons.lock ),
        //Izquierda
        suffixIcon: Icon(Icons.lock_open)
      ),
      onChanged: (valor){
        _updateState(campo:'_pass', valor: valor);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      // No permitir Copiar/Pegar
      enableInteractiveSelection: false,
      // Escuchador de este INPUT
      controller: _inputFecha,
     
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Cantidad: ${_nombre.length}'),
        hintText: 'Fecha hoy',
        labelText: 'Datee',
        helperText: 'Aca va la fecha',
        // Derecha
        icon: Icon( Icons.calendar_today ),
        //Izquierda
        suffixIcon: Icon(Icons.perm_contact_calendar)
      ),
      onTap: (){
        // Quitar foco del input:
        FocusScope.of(context).requestFocus(new FocusNode());

        _selectDate(context);
      }
    );
  }

  void _selectDate(BuildContext context) async {

    DateTime valorDateTime = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );
    if( valorDateTime != null ){
      String valor = valorDateTime.toString();

      _updateState(campo:'_fecha', valor: valor);
    }

  }

  Widget _crearPersona() {
   return ListTile(
     title: Text('Persona: $_nombre'),
     subtitle: Text('Correo: $_email  Pass: $_pass'),
      trailing: Text( _select ),
   );
 }


  List<DropdownMenuItem<String>> getOptionsList () {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach(( poder ){
      lista.add( DropdownMenuItem(
        child:Text( poder ) ,
        //key: ,
        value: poder,
        )
      );
    });

    return lista;

  }

  Widget _crearDropDown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox( width: 30.0 ),

        Expanded(
                  child: DropdownButton(
            items: getOptionsList(),
            onChanged: (  valor){

              _updateState(campo:'_select', valor: valor);
            },
            value: _select,
          ),
        )
      ],
    );
    
        

  }

  

 



}







