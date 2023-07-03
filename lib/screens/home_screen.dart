import 'package:flutter/material.dart';
import 'package:weather_app_flutter/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/widgets/current_weather_widget.dart';
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
            ? const Center(child: CircularProgressIndicator())
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
                            .getHourlyWeather())
                  ],
                ),
              )),
      ),
    );
  }
}
