import 'package:flutter/material.dart';
import 'package:weather_app_flutter/model/weather_data_current.dart';
import 'package:weather_app_flutter/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temperature
        temperatureWidget(),
        // weather description
        weatherDescriptionWidget(),
      ],
    );
  }

  Widget temperatureWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        // Divider between icon and temperature
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerColor,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.current.temp!.toInt()}°",
                style: const TextStyle(
                  fontSize: 68,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.textColor,
                ),
              ),
              TextSpan(
                text: "${weatherDataCurrent.current.weather![0].description}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget weatherDescriptionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
