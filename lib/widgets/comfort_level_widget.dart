import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app_flutter/model/weather_data_current.dart';

import '../utils/custom_colors.dart';

class ComfortLevelWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const ComfortLevelWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            'Comfort Level',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 12,
                      trackWidth: 12,
                      handlerSize: 0,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: const TextStyle(
                          letterSpacing: 0.1, fontSize: 14, height: 1.5),
                    ),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomColors.firstGradientColor.withAlpha(50),
                        progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ]),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: "Feels Like ",
                      style: TextStyle(
                        color: CustomColors.textColor,
                        fontSize: 14,
                        height: 0.8,
                      ),
                    ),
                    TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                          color: CustomColors.textColor,
                          fontSize: 14,
                          height: 0.8,
                        ))
                  ])),
                  Container(
                    height: 25,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColors.dividerColor,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: "UV Index ",
                      style: TextStyle(
                        color: CustomColors.textColor,
                        fontSize: 14,
                        height: 0.8,
                      ),
                    ),
                    TextSpan(
                        text: "${weatherDataCurrent.current.uvIndex}",
                        style: const TextStyle(
                          color: CustomColors.textColor,
                          fontSize: 14,
                          height: 0.8,
                        ))
                  ])),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
