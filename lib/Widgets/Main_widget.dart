import 'package:flutter/material.dart';
import 'weathertile_Tile.dart';
import 'package:state_2/Screen/location.dart';

class MainWidget extends StatelessWidget {
  late final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String wether;
  final int humidity;
  final double windspeed;

  MainWidget({
    required this.location,
    required this.humidity,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.wether,
    required this.windspeed,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          color: Color(0xfff1f1f1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          FlatButton.icon(
                onPressed: () async{
                  Navigator.pushNamed(context, '/location');

                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.purple,
                ),
                label: Text(
                  '${location}',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0 ,bottom: 10.0),
                child: Text(
                  '${temp.toInt().toString()}',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                'high of ${tempMax.toInt().toString()} ,low of ${tempMin.toInt().toString()}',
                style: TextStyle(
                  color: Color(0xff9e9e9e),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                WeatherTile(icon: Icons.thermostat_outlined, title: 'Temperatuer', subtitle: '${temp.toInt().toString()}'),
                WeatherTile(icon: Icons.filter_drama_outlined, title: 'Wether', subtitle: '${wether.toString()}'),
                WeatherTile(icon: Icons.wb_sunny, title: 'Humidity', subtitle: '${humidity.toString()}'),
                WeatherTile(icon: Icons.waves_outlined, title: 'wind_speed', subtitle: '${windspeed.toInt().toString()}MPH'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
