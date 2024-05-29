import 'package:weatherapp/models/weather_model.dart';

abstract class weatherState {}

class loadingDataState extends weatherState {}

class successState extends weatherState {
  weatherModel weathermodel;
  successState({required this.weathermodel});
}

class failureState extends weatherState {}

class initialState extends weatherState {}
