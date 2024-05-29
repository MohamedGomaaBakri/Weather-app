import 'package:flutter/material.dart';

class weatherModel {
  String date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  weatherModel(
      {required this.date,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory weatherModel.fromjson(dynamic data) {
    return weatherModel(
        date: data['location']['localtime'],
        avgTemp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStateName: data['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }

  @override
  String toString() {
    return ('date = $date , avg temp = $avgTemp , maxTemp = $maxTemp , mintemp =$minTemp , wearher state = $weatherStateName');
  }

  String getimage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain ' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Patchy rain nearby') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain ' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Patchy rain nearby') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder') {
      return Colors.blueGrey;
    } else {
      return Colors.orange;
    }
  }
}
