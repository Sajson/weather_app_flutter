import 'dart:convert';

import 'package:weather_app_flutter/model/weather_data_current.dart';

import '../model/weather_data.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';

String apiURL(var lat, var lon) {
  String url =
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,daily&appid=$apiKey&exclude=minutely&units=metric';
  return url;
}

class FetchWeather {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var res = await http.get(Uri.parse(apiURL(lat, lon)));
    if (res.statusCode == 200) {
      var decodedJson = jsonDecode(res.body);
      weatherData = WeatherData(WeatherDataCurrent.fromJson(decodedJson));
      return weatherData!;
    } else {
      throw Exception(res.body);
    }
  }
}
