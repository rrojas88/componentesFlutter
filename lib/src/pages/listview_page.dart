import 'dart:async';

import 'package:flutter/material.dart';


class ListaPage extends StatefulWidget {
  //listaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _miScroll = new ScrollController();

  List<int> _listaNum = new List();

  int _ultimoNum = 0;
  bool _isLoading = false;


  @override
  void initState(){
    super.initState();

    _agregar10(); 

    // COntrol scroll 
    _miScroll.addListener((){

      if( _miScroll.position.pixels == _miScroll.position.maxScrollExtent ){
        //_agregar10();

        fetchData();
      }

    });
  }

  @override
  void dispose(){
    super.dispose();
    _miScroll.dispose(); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listaa ok'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista( context ),
          _crearLoading(),
        ],
      )
    );
  }


  Widget _crearLista(BuildContext context){

    return RefreshIndicator(

      onRefresh: obtenPag1,

      child: ListView.builder(
        controller: _miScroll,

        itemCount: _listaNum.length,
        itemBuilder: (BuildContext context, int index){
          
          final imagen = _listaNum[ index ];

          return FadeInImage(
            placeholder: AssetImage('assets/073 jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
          );
        }
      ),
    );
  }


  Future<Null> obtenPag1() async {

    final duration = new Duration( seconds: 2 );
     new Timer( duration, (){

      _listaNum.clear();
      _ultimoNum++;

      _agregar10();
    });

    return Future.delayed(duration);
  }


  void _agregar10(){

    for( var i=1; i<10; i++){
      _ultimoNum++;

      _listaNum.add( _ultimoNum );
    }
  }


  Future<Null> fetchData() async {
    print('Entra en fecht() ...............');
    _isLoading = true;
    setState(() { });

    final duration = new Duration( seconds: 2 );
    return new Timer( duration, respuestaHTTP );

  }

  void respuestaHTTP (){
    print('Entra en respuestaHTTP()');
    _isLoading = false;
    // setState(() { });
    _agregar10();

    _miScroll.animateTo(
      //offset, 
      _miScroll.position.pixels + 100,
      duration: Duration( milliseconds: 250 ), 
      curve: Curves.fastOutSlowIn
    );

  }

  Widget _crearLoading() {
    print(' crearLoading() = $_isLoading');
    if( _isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox( height: 15.0 )
            ],
          )

        ],
      );
    }
    else{
      return Container();
    }
  }


}