
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animar_page.dart';
import 'package:componentes/src/pages/inputs_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listview_page.dart';


Map <String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/'         : ( BuildContext context ) => HomePage(),
    'alert'     : ( BuildContext context ) => AlertPage(),
    'avatar'    : ( BuildContext context ) => AvatarPage(),
    'card'      : ( BuildContext context ) => CardPage(),
    'animar'    : ( BuildContext context ) => AnimarPage(),
    'inputs'    : ( BuildContext context ) => Inputs1Page(),
    'slider'    : ( BuildContext context ) => SliderPage(),
    'listas'    : ( BuildContext context ) => ListaPage(),
  };
}
