import 'package:flutter/material.dart';
import 'package:weather_app_flutter/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/utils/custom_colors.dart';
import 'package:weather_app_flutter/widgets/comfort_level_widget.dart';
import 'package:weather_app_flutter/widgets/current_weather_widget.dart';
import 'package:weather_app_flutter/widgets/forecast_widget.dart';
import 'package:weather_app_flutter/widgets/header_widget.dart';
import 'package:weather_app_flutter/widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call GlobalController
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/clouds.png",
                    height: 150,
                    width: 150,
                  ),
                  const CircularProgressIndicator()
                ],
              ))
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),
                    CurrentWeatherWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather()),
                    const SizedBox(
                      height: 20,
                    ),
                    HourlyWeatherWidget(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getHourlyWeather()),
                    const SizedBox(
                      height: 20,
                    ),
                    ForecastWidget(
                        weatherDataDaily: globalController
                            .getWeatherData()
                            .getDailyWeather()),
                    Container(
                      height: 1,
                      color: CustomColors.dividerColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ComfortLevelWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather()),
                  ],
                ),
              )),
      ),
    );
  }
}
