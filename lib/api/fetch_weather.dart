

import 'dart:convert';

import 'package:weather24/api/api_key.dart';
import 'package:weather24/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather24/model/weather_data_current.dart';
import 'package:weather24/model/weather_data_hourly.dart';

import '../utils/api_url.dart';

class FetchWeatherAPI{

  WeatherData? weatherData;

//  processing data from respon to json

Future<WeatherData> processData(lat, lon) async{
   var response = await http.get(Uri.parse(apiURl(lat, lon)));
   var jsonString = jsonDecode(response.body);
   weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
   WeatherDataHourly.fromJson(jsonString));

   return weatherData!;
}
}

