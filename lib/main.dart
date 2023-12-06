import 'package:flutter/material.dart';
import 'package:todolist/pages/home.dart';
import 'package:todolist/pages/main_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',   //изначальный путь, запускается класс МейнСкрин
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home(),
  },
));