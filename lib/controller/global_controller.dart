import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../api/fetch_weather.dart';
import '../model/weather_data.dart';

class GlobalController extends GetxController {
  // create variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lat = 0.0.obs;
  final RxDouble _lon = 0.0.obs;
  final weatherData = WeatherData().obs;

  // creating instances
  RxBool checkLoading() => _isLoading;

  RxDouble getLat() => _lat;

  RxDouble getLon() => _lon;

  WeatherData getWeatherData() => weatherData.value;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  // create functions
  void getLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // permission checking
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    // get current location
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      _lat.value = position.latitude;
      _lon.value = position.longitude;
      // calling API
      return FetchWeather().processData(_lat.value, _lon.value).then((value) {
        _isLoading.value = false;
        weatherData.value = value;
      });
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }
}
