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
        const SizedBox(
          height: 20,
        ),
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // wind speed
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.cardColor,
              ),
              child: Image.asset("assets/icons/wind.png"),
            ),
            // humidity
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.cardColor,
              ),
              child: Image.asset("assets/icons/humidity.png"),
            ),
            // clouds
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.cardColor,
              ),
              child: Image.asset("assets/icons/clouds.png"),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed} km/h",
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity}%",
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    );
  }
}
