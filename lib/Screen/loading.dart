import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:state_2/Widgets/fetchdata.dart';





class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


Future<void> setupweather() async{

  WeatherInfo instance=WeatherInfo(location: 'Khartoum', humidity: 7, temp: 85, tempMax: 90, tempMin: 80, wether: 'clear sky', windspeed: 1);

  await instance.fetchWeather();
  Navigator.pushReplacementNamed(context, '/Home',arguments: {
    'location':instance.location ,
    'humidity':instance.humidity,
    'temp':instance.temp,
    'tempMax':instance.tempMax,
    'tempMin':instance.tempMin,
    'wether':instance.wether,
    'windspeed':instance.windspeed,
  });
}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ) ,
      ),
    );
  }
}
