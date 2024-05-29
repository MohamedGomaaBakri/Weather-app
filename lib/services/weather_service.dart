import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

String apiKey = '24d56690db664d1297c84300240703';
String baseUrl = 'http://api.weatherapi.com/v1';

class weatherservice {
  Future<weatherModel?> getweather({required String CityName}) async {
    weatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = weatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
