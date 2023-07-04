import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/model/weather_data_daily.dart';
import 'package:weather_app_flutter/utils/custom_colors.dart';

Widget forecastList({required WeatherDataDaily weather}) {
  String convertFromTimeStampToDay(int timeStamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('EEE').format(date);
  }

  return SizedBox(
    height: 300,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: weather.daily.length > 7 ? 7 : weather.daily.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                        convertFromTimeStampToDay(weather.daily[index].dt!),
                        style: const TextStyle(
                            fontSize: 15, color: CustomColors.textColor)),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                        "assets/weather/${weather.daily[index].weather![0].icon}.png"),
                  ),
                  Text(
                    "${weather.daily[index].temp!.max}°/${weather.daily[index].temp!.min}°",
                  )
                ],
              ),
            ),
            // Divider
            Container(
              height: 1,
              color: CustomColors.dividerColor,
            )
          ],
        );
      },
    ),
  );
}
