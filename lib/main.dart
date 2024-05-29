// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/weather_cubit/weatherCubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/views/homePage.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return weatherCubit(weatherservice());
      },
      child: weatherApp(),
    ),
  );
}

class weatherApp extends StatelessWidget {
  weatherApp({super.key});

  weatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
