


import 'package:flutter/material.dart';
import 'package:state_2/Screen/home.dart';
import 'package:state_2/Screen/loading.dart';
import 'package:state_2/Screen/location.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/Home':(context) => Home(),
    '/location':(context) => ChooseLocation(),
  },
));

