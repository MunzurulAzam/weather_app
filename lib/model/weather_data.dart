import 'package:weather24/model/weather_data_current.dart';
import 'package:weather24/model/weather_data_daily.dart';
import 'package:weather24/model/weather_data_hourly.dart';

class WeatherData{
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);
//  input (this.hourly )

//  function to fetch value
    WeatherDataCurrent getCurrentWeather() => current!;
    WeatherDataHourly getHourlyWeather() => hourly!;
    WeatherDataDaily getDailyWeather() => daily!;
}