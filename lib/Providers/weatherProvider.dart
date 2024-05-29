// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class weatherProvider extends ChangeNotifier {
  weatherModel? _weatherData;
  String? CityName;
  set weatherData(weatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  weatherModel? get weatherData => _weatherData;
}
