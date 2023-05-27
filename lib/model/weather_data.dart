import 'package:weather24/model/weather_data_current.dart';
import 'package:weather24/model/weather_data_hourly.dart';

class WeatherData{
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;

  WeatherData([this.current, this.hourly]);
//  input (this.hourly )

//  function to fetch value
    WeatherDataCurrent getCurrentWeather() => current!;
    WeatherDataHourly getHourlyWeather() => hourly!;
}