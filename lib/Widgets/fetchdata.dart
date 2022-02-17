
import 'dart:convert';

import 'package:http/http.dart' as http;



class WeatherInfo{


  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String wether;
  final int humidity;
  final double windspeed;

  WeatherInfo({
    required this.location,
    required this.humidity,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.wether,
    required this.windspeed,
  });




Future<WeatherInfo> fetchWeather () async{


  //
  // final location='Khartoum';
  final apiKey='6c0ba73e232a274712c40340ea2338a3';
  final requstUrl='http://api.openweathermap.org/data/2.5/weather?q=$location&units=imperial&appid=${apiKey}';


  final respons = await http.get(Uri.parse(requstUrl));

  if(respons.statusCode==200){
    return WeatherInfo.fromjson(jsonDecode(respons.body));
  }else{
    throw Exception('Error loading requst Url info');
  }
}




  factory WeatherInfo.fromjson(Map<String,dynamic>json){
    return WeatherInfo(
      location: json['name'],
      temp: json['main']['temp'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      wether: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windspeed: json['wind']['speed'],
    );
  }
}
