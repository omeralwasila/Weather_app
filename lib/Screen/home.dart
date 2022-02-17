

import 'package:flutter/material.dart';
import 'package:state_2/Widgets/Main_widget.dart';

import 'dart:async';

import 'package:state_2/Widgets/fetchdata.dart';


class Home extends StatefulWidget {

  late Future<WeatherInfo>   futureWeather;

  @override
  void initState(){

    futureWeather= fetchWeather();
  }


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<WeatherInfo>(
          future: fetchWeather() ,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return MainWidget(
                location: snapshot.data!.location,
                temp: snapshot.data!.temp,
                tempMax: snapshot.data!.tempMax,
                tempMin: snapshot.data!.tempMin,
                wether: snapshot.data!.wether,
                humidity: snapshot.data!.humidity,
                windspeed: snapshot.data!.windspeed,
              );
            }else if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },

        )
    );
  }
}
