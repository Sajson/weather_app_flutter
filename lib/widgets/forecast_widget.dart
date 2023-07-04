import 'package:flutter/material.dart';
import 'package:weather_app_flutter/model/weather_data_daily.dart';
import 'package:weather_app_flutter/utils/custom_colors.dart';

import 'forecast_list.dart';

class ForecastWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const ForecastWidget({Key? key, required this.weatherDataDaily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerColor.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Forecast for next days',
              style: TextStyle(
                fontSize: 17,
                color: CustomColors.textColor,
              ),
            ),
          ),
          forecastList(weather: weatherDataDaily)
        ],
      ),
    );
  }
}
