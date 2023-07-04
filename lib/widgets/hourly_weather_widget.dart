import 'package:flutter/material.dart';
import '../model/weather_data_hourly.dart';
import 'hourly_list.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;

  const HourlyWeatherWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            alignment: Alignment.topCenter,
            child: const Text(
              "Today",
              style: TextStyle(fontSize: 20),
            )),
        hourlyList(weatherDataHourly: weatherDataHourly),
      ],
    );
  }
}
