import 'dart:math';

import 'package:flutter/material.dart';

class AnimarPage extends StatefulWidget {
  //AnimarPage({Key key}) : super(key: key);

  @override
  _AnimarPageState createState() => _AnimarPageState();
}

class _AnimarPageState extends State<AnimarPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaciones'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          //color: _color,
          child: Text( 'Animacion'),
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Run'),
        onPressed: (){

          final random = Random();

          _width = random.nextInt(300).toDouble();
          _height = random.nextInt(300).toDouble();
          _color = Color.fromRGBO(
            random.nextInt(255), 
            random.nextInt(255), 
            random.nextInt(255), 
            1); // opacity 

          _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

          setState(() {
            
          });
        },
      ),
    );
  }
}