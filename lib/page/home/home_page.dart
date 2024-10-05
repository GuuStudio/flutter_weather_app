import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/widgets/home_detail_weather.dart';
import 'package:weather/widgets/home_location.dart';
import 'package:weather/widgets/home_weather_icon.dart';

import '../../models/weather_current_data.dart';
import '../../widgets/home_temperature.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ],
          ),
        ),
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurrent(),
          initialData: null,
          builder : (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No Data'),
              );
            }
            WeatherCurrentData data = snapshot.data as WeatherCurrentData;
             return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeWeatherIcon(nameIcon: data.weathers[0].description,),
                HomeTemperature(temp: data.main.temp,),
                HomeLocation(location: data.name,),
                const SizedBox(height: 40,),
                HomeDetailWeather(speedWind: data.wind.speed, humidity: data.main.humidity,),
              ],
            );
          }
        ),
      ),
    );
  }
}


