import 'package:flutter/material.dart';
import 'package:state_2/Widgets/fetchdata.dart';




class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WeatherInfo> Locations=[
    // 'Khartoum',
    // 'London',
    // 'Cairo'
  WeatherInfo(location: 'Khartoum', humidity: 7, temp: 85, tempMax: 90, tempMin: 80, wether: 'clear sky', windspeed: 1),
  WeatherInfo(location: 'Cairo', humidity: 7, temp: 85, tempMax: 90, tempMin: 80, wether: 'clear sky', windspeed: 1),
  WeatherInfo(location: 'London', humidity: 7, temp: 85, tempMax: 90, tempMin: 80, wether: 'clear sky', windspeed: 1),

  ];

  void updateWeather(index) async{
    WeatherInfo instance =Locations[index] as WeatherInfo;
    await instance.fetchWeather();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'humidity':instance.humidity,
      'temp':instance.temp,
      'tempMax':instance.tempMax,
      'tempMin':instance.tempMin,
      'wether':instance.wether,
      'windspeed':instance.windspeed,

    });
  }

  // void updateWeather(index) async{
  //   WeatherInfo instance =Locations[index];
  //   await instance.fetchWeather();
  //   //navigate to home screen
  //   Navigator.pop(context,{
  //     'location':instance.location,
  //     'humidity':instance.humidity,
  //     'temp':instance.temp,
  //     'tempMax':instance.tempMax,
  //     'tempMin':instance.tempMin,
  //     'wether':instance.wether,
  //     'windspeed':instance.windspeed,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Colors.purple,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,

      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child:ListTile(
                onTap: (){
                  updateWeather(index);
                },
                title: Text(Locations[index].location),
              ),
            ) ,
          );

        },
      ),
    );
  }
}
