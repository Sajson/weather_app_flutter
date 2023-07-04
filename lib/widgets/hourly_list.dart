import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controller/global_controller.dart';
import '../model/weather_data_hourly.dart';
import '../utils/custom_colors.dart';
import 'hourly_details.dart';

Widget hourlyList({required WeatherDataHourly weatherDataHourly}) {
  final RxInt selectedHour = GlobalController().getIndex();

  return Container(
    height: 150,
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      // condition to check if the hourly data have more than 12 hours to not display too much data
      itemCount: weatherDataHourly.hourly.length > 12
          ? 12
          : weatherDataHourly.hourly.length,
      itemBuilder: (context, index) {
        // Obx to update the selectedHour value
        return Obx(() => GestureDetector(
            onTap: () {
              selectedHour.value = index;
            },
            child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.dividerColor.withAlpha(150),
                      spreadRadius: 1,
                      blurRadius: 30,
                      offset: const Offset(0.5, 0),
                    ),
                  ],
                  gradient: selectedHour.value == index
                      ? const LinearGradient(colors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ])
                      : null,
                ),
                child: HourlyDetails(
                  index: index,
                  selectedHourIndex: selectedHour.value,
                  temp: weatherDataHourly.hourly[index].temp!,
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  icon: weatherDataHourly.hourly[index].weather![0].icon!,
                ))));
      },
    ),
  );
}
