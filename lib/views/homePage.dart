// ignore_for_file: file_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/weather_cubit/weatherCubit.dart';
import 'package:weatherapp/Cubits/weather_cubit/weatherState.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/views/search%20screen.dart';

class homePage extends StatelessWidget {
  homePage({super.key});
  weatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BlocProvider.of<weatherCubit>(context).Weathermodel == null
                ? Colors.blue
                : BlocProvider.of<weatherCubit>(context)
                    .Weathermodel!
                    .getThemeColor(),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchScreen();
                }));
              },
              icon: const Icon(Icons.search),
            );
          })
        ],
        title: const Text(
          'Weather App',
        ),
      ),
      body: BlocBuilder<weatherCubit, weatherState>(
        builder: (context, state) {
          if (state is loadingDataState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is successState) {
            return successBody(weatherData: state.weathermodel);
          } else if (state is failureState) {
            return const Center(
              child: Text('something went wrong please try again'),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class successBody extends StatelessWidget {
  const successBody({
    super.key,
    required this.weatherData,
  });

  final weatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              BlocProvider.of<weatherCubit>(context).CityName!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at : ${weatherData!.date}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  weatherData!.getimage(),
                ),
                Text(
                  weatherData?.avgTemp.toInt().toString() ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Max temp : ${weatherData!.maxTemp.toInt().toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Min temp : ${weatherData!.minTemp.toInt().toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherData!.weatherStateName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
