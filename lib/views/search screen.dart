// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/weather_cubit/weatherCubit.dart';

class searchScreen extends StatelessWidget {
  searchScreen({super.key});

  String? CityName;

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
          title: Text('search to a city'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (data) async {
                CityName = data;

                BlocProvider.of<weatherCubit>(context)
                    .getweather(CityName: CityName!);
                BlocProvider.of<weatherCubit>(context).CityName = CityName;

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'Enter a city Name',
                label: Text('Search'),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ));
  }
}
